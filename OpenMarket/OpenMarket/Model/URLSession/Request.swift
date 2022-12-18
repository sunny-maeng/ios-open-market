//
//  Request.swift
//  OpenMarket
//
//  Created by 써니쿠키, 메네 on 2022/11/16.
//

import Foundation
import UIKit

enum Request {
    case healthChecker
    case productList(pageNumber: Int, itemsPerPage: Int)
    case productDetail(productNumber: Int)
    case productRegistration
    case productEdit(productId: Int)
    case productDeleteUriInquiry(productId: Int)
    case productDelete(url: String)
    
    var url: URL? {
        let apiPath = "api/products"
        switch self {
        case .healthChecker:
            return URLComponents.marketUrl(path: ["healthChecker"], queryItems: nil)
        case .productList(let pageNumber, let itemsPerPage):
            return URLComponents.marketUrl(path: [apiPath],
                                           queryItems: [URLQueryItem(name: "page_no",
                                                                     value: String(pageNumber)),
                                                        URLQueryItem(name: "items_per_page",
                                                                     value: String(itemsPerPage))])
        case .productDetail(let productNumber):
            return URLComponents.marketUrl(path: [apiPath, String(productNumber)], queryItems: nil)
        case .productRegistration:
            return URLComponents.marketUrl(path: [apiPath], queryItems: nil)
        case .productEdit(let productId):
            return URLComponents.marketUrl(path: [apiPath, String(productId)], queryItems: nil)
        case .productDeleteUriInquiry(let productId):
            return URLComponents.marketUrl(path: [apiPath, String(productId), "archived"],
                                           queryItems: nil)
        case .productDelete(let uri):
            return URLComponents.marketUrl(path: [uri], queryItems: nil)
        }
    }
    
    static var identifier: String {
        return "b7069a7d-6940-11ed-a917-1f26f7cfa9c9"
    }
}

struct RequestManager {
    func generateRequest(url: URL,
                         httpMethod: HttpMethod,
                         headers: [String: String],
                         bodyData: Data?) -> URLRequest {
        var request = URLRequest(url: url)
        
        request.httpMethod = httpMethod.name
        headers.forEach { (headerField, value) in
            request.addValue(value, forHTTPHeaderField: headerField)
        }
        
        if let bodyData = bodyData {
            request.httpBody = bodyData
        }
        
        return request
    }
    
    func generateMultiPartFormDataRequest(textParameters: [String : Data],
                                          imageKey: String,
                                          images: [UIImage]) -> URLRequest? {
        let lineBreak = "\r\n"
        let boundary = "Boundary-\(UUID().uuidString)"
        
        guard let url = Request.productRegistration.url else {
            print(NetworkError.generateUrlFailError.localizedDescription)
            return nil
        }
        
        var request = URLRequest(url: url)
        
        request.httpMethod = HttpMethod.post.name
        request.addValue("multipart/form-data; boundary=\(boundary)",
                         forHTTPHeaderField: "Content-Type")
        request.addValue(Request.identifier,
                         forHTTPHeaderField: "identifier")
        
        let stringBodyData = createTextBodyData(parameters: textParameters,
                                                boundary: boundary)
        
        guard let imageBodyData = createImageBodyData(key: imageKey,
                                                      images: images,
                                                      boundary: boundary) else {
            print(NetworkError.generateImageDataFailError.localizedDescription)
            return nil
        }
        
        var bodyData = Data()
        
        bodyData.append(stringBodyData)
        bodyData.append(imageBodyData)
        bodyData.append("--\(boundary)--\(lineBreak)")
        
        request.httpBody = bodyData
        
        return request
    }
    
    private func createTextBodyData(parameters: [String : Data],
                                    boundary: String) -> Data {
        let lineBreak = "\r\n"
        var body = Data()
        
        for (key, value) in parameters {
            body.append("--\(boundary + lineBreak)")
            body.append("Content-Disposition: form-data; name=\"\(key)\"\(lineBreak + lineBreak)")
            body.append(value)
            body.append(lineBreak)
        }
        
        return body
    }
    
    private func createImageBodyData(key: String,
                                     images: [UIImage],
                                     boundary: String) -> Data? {
        let lineBreak = "\r\n"
        var body = Data()
        
        for image in images {
            guard let imageData = image.jpegData(compressionQuality: 0.5) else {
                print(NetworkError.generateImageDataFailError.localizedDescription)
                return nil
            }
            
            body.append("--\(boundary + lineBreak)")
            body.append("Content-Disposition: form-data; name=\"\(key)\"; filename=\"image\"")
            body.append(lineBreak)
            body.append("Content-Type: \"multipart/form-data\"")
            body.append(lineBreak + lineBreak)
            body.append(imageData)
            body.append(lineBreak)
        }
        
        return body
    }
}

extension RequestManager {
    enum HttpMethod {
        case get
        case post
        case patch
        case delete
        
        var name: String {
            switch self {
            case .get:
                return "GET"
            case .post:
                return "POST"
            case .patch:
                return "PATCH"
            case .delete:
                return "DELETE"
            }
        }
    }
}

extension Data {
    mutating func append(_ string: String) {
        if let data = string.data(using: .utf8) {
            self.append(data)
        }
    }
}

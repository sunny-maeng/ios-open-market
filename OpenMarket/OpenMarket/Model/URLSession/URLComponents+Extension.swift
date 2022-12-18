//
//  .swift
//  OpenMarket
//
//  Created by 써니쿠키, 메네 on 15/11/2022.
//

import Foundation

extension URLComponents {
    static func marketUrl(path: [String]?, queryItems: [URLQueryItem]?) -> URL? {
        let baseUrl = "https://openmarket.yagom-academy.kr"
        var urlComponents = Self(string: baseUrl)
        
        if let path = path {
            _ = path.map {
                if $0.first == "/" {
                    urlComponents?.path.append(contentsOf: $0)
                } else {
                    urlComponents?.path.append("/\($0)") }
            }
        }
        
        if let queryItems = queryItems {
            urlComponents?.queryItems = queryItems
        }
        
        return urlComponents?.url
    }
}

//
//  decoderExtension.swift
//  OpenMarket
//
//  Created by 써니쿠키, 메네 on 2022/11/15.
//

import UIKit

extension JSONDecoder {
    static func decode<T: Decodable>(type: T.Type, from asset: String) -> T? {
        let decoder = JSONDecoder()
        
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        guard let asset = NSDataAsset(name: asset) else { return nil }
        
        do {
            let data: T = try decoder.decode(type, from: asset.data)
            return data
        } catch {
            print(error.localizedDescription)
            return nil
        }
    }
}

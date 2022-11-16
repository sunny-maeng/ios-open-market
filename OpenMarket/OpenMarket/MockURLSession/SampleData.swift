//
//  SampleData.swift
//  OpenMarket
//
//  Created by 써니쿠키, 메네 on 2022/11/16.
//

import Foundation
import UIKit

enum SampleDate {
    var sampleData: Data {
        Data(
            """
            {
              "page_no": 1,
              "items_per_page": 20,
              "total_count": 10,
              "offset": 0,
              "limit": 20,
              "pages": [
                {
                  "id": 20,
                  "vendor_id": 3,
                  "name": "Test Product",
                  "thumbnail": "https://s3.ap-northeast-2.amazonaws.com/media.yagom-academy.kr/training-resources/3/thumb/5a0cd56b6d3411ecabfa97fd953cf965.jpg",
                  "currency": "KRW",
                  "price": 0,
                  "bargain_price": 0,
                  "discounted_price": 0,
                  "stock": 0,
                  "created_at": "2022-01-04T00:00:00.00",
                  "issued_at": "2022-01-04T00:00:00.00"
                
                }
              ],
              "last_page": 1,
              "has_next": false,
              "has_prev": false
            }

            """.utf8
        )
    }
}

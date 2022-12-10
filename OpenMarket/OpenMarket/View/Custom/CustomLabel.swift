//
//  CustomLabel.swift
//  OpenMarket
//
//  Created by 맹선아 on 2022/12/10.
//

import UIKit

class CustomLabel: UILabel {
    init(textAlignment: NSTextAlignment = .left,
         font: UIFont = .preferredFont(forTextStyle: .body)) {
        super.init(frame: .zero)
        self.textAlignment = textAlignment
        self.font = font
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

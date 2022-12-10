//
//  RegistrationViewControllerProtocol.swift
//  OpenMarket
//
//  Created by 써니쿠키 on 2022/12/10.
//

import Foundation
import UIKit

protocol registrationViewController: UIViewController {
    var registrationView: RegistrationView! { get set }
}

//MARK: - check UserInput is available
extension registrationViewController {
    func checkProductNameInput() -> String? {
        guard let name = registrationView.productNameTextField.text,
              name.count >= 3,
              name.count <= 100 else {
            CustomAlert.showAlert(message: "상품명은 3~100자로 입력해 주세요", target: self)
            return nil
        }
        
        return name
    }
    
    func checkProductPriceInput() -> Double? {
        guard let priceInput = registrationView.productPriceTextField.text,
              let price = Double(priceInput) else {
            CustomAlert.showAlert(message: "가격을 확인해 주세요", target: self)
            return nil
        }
        
        return price
    }
    
    func checkProductDiscountedPriceInput() -> Double? {
        if registrationView.productDiscountPriceTextField.text == "" {
            registrationView.productDiscountPriceTextField.text = "0"
        }
        
        guard let discountedPriceInput = registrationView.productDiscountPriceTextField.text,
              let discountedPrice = Double(discountedPriceInput) else {
            CustomAlert.showAlert(message: "할인 가격을 확인해 주세요", target: self)
            return nil
        }
        
        return discountedPrice
    }
    
    func checkProductStockInput() -> Int? {
        if registrationView.stockTextField.text == nil {
            registrationView.stockTextField.text = "0"
        }
        
        guard let stockInput = registrationView.stockTextField.text,
              let stock = Int(stockInput) else {
            CustomAlert.showAlert(message: "재고 입력을 확인해 주세요", target: self)
            return nil
        }
        
        return stock
    }
    
    func checkProductDescriptionInput() -> String? {
        guard let description = registrationView.productDescriptionTextView.text,
              description.count >= 10,
              description.count <= 1000 else {
            CustomAlert.showAlert(message: "상세내용은 10~1000자 이내로 입력해야 합니다", target: self)
            return nil
        }
        
        return description
    }
    
    func checkProductCurrencyInput() -> Currency {
        return registrationView.currencySegmentControl.selectedSegmentIndex == 0
        ? Currency.krw
        : Currency.usd
    }
}

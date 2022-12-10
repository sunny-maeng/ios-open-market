//
//  EditRegistrationViewController.swift
//  OpenMarket
//
//  Created by 써니쿠키 on 2022/12/10.
//

import UIKit

class EditRegistrationViewController: UIViewController {
    let page: Page
    private var editRegistrationView: RegistrationView!
    
    init(page: Page) {
        self.page = page
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        editRegistrationView = RegistrationView()
        self.view = editRegistrationView
        setupNavigationBar()
        controlKeyBoard()
        configureEditRegistrationView()
        
        editRegistrationView.productDescriptionTextView.delegate = self
        editRegistrationView.mainScrollView.delegate = self
        editRegistrationView.imageCollectionView.delegate = self
        editRegistrationView.imageCollectionView.dataSource = self
        editRegistrationView.imageCollectionView.register(
            RegisterImageCell.self,
            forCellWithReuseIdentifier: RegisterImageCell.identifier
        )
    }
    
    private func setupNavigationBar() {
        let button = UIBarButtonItem(title: "Done",
                                     style: .plain,
                                     target: self,
                                     action: #selector(editRegisterProduct))
        
        navigationItem.title = "상품수정"
        navigationItem.rightBarButtonItem  = button
    }
    
    @objc private func editRegisterProduct() {
        
    }
    
    func configureEditRegistrationView() {
        guard let editRegistrationView = editRegistrationView else {
            return
        }
        
        editRegistrationView.productNameTextField.text = page.name
        editRegistrationView.productPriceTextField.text = String(page.price)
        editRegistrationView.productDiscountPriceTextField.text = String(page.discountedPrice)
        editRegistrationView.productDescriptionTextView.text = page.description
        editRegistrationView.productDescriptionTextView.textColor = .black
        editRegistrationView.stockTextField.text = String(page.stock)
        editRegistrationView.currencySegmentControl.selectedSegmentIndex =
        page.currency == Currency.krw ? 0 : 1
    }
}

//MARK: - check UserInput is available
extension EditRegistrationViewController {
    private func checkProductNameInput() -> String? {
        guard let name = editRegistrationView.productNameTextField.text,
              name.count >= 3,
              name.count <= 100 else {
            CustomAlert.showAlert(message: "상품명은 3~100자로 입력해 주세요", target: self)
            return nil
        }
        
        return name
    }
    
    private func checkProductPriceInput() -> Double? {
        guard let priceInput = editRegistrationView.productPriceTextField.text,
              let price = Double(priceInput) else {
            CustomAlert.showAlert(message: "가격을 확인해 주세요", target: self)
            return nil
        }
        
        return price
    }
    
    private func checkProductDiscountedPriceInput() -> Double? {
        if editRegistrationView.productDiscountPriceTextField.text == "" {
            editRegistrationView.productDiscountPriceTextField.text = "0"
        }
        
        guard let discountedPriceInput = editRegistrationView.productDiscountPriceTextField.text,
              let discountedPrice = Double(discountedPriceInput) else {
            CustomAlert.showAlert(message: "할인 가격을 확인해 주세요", target: self)
            return nil
        }
        
        return discountedPrice
    }
    
    private func checkProductStockInput() -> Int? {
        if editRegistrationView.stockTextField.text == nil {
            editRegistrationView.stockTextField.text = "0"
        }
        
        guard let stockInput = editRegistrationView.stockTextField.text,
              let stock = Int(stockInput) else {
            CustomAlert.showAlert(message: "재고 입력을 확인해 주세요", target: self)
            return nil
        }
        
        return stock
    }
    
    private func checkProductDescriptionInput() -> String? {
        guard let description = editRegistrationView.productDescriptionTextView.text,
              description.count >= 10,
              description.count <= 1000 else {
            CustomAlert.showAlert(message: "상세내용은 10~1000자 이내로 입력해야 합니다", target: self)
            return nil
        }
        
        return description
    }
    
    private func checkProductCurrencyInput() -> Currency {
        return editRegistrationView.currencySegmentControl.selectedSegmentIndex == 0
        ? Currency.krw
        : Currency.usd
    }
}

//MARK: - CollectionView
extension EditRegistrationViewController: UICollectionViewDelegate,
                                          UICollectionViewDataSource,
                                          UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return page.images?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: RegisterImageCell.identifier,
            for: indexPath) as? RegisterImageCell else {
            return UICollectionViewCell()
        }
        
        cell.fetchImage(page: page, index: indexPath.item)
    
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.height * 0.8,
                      height: collectionView.frame.height * 0.8)
    }
}

//MARK: - control Keyboard
extension EditRegistrationViewController: UIScrollViewDelegate {
    private func controlKeyBoard () {
        let singleTapGestureRecognizer = UITapGestureRecognizer(target: self,
                                                                action: #selector(hideKeyBoard))
        
        editRegistrationView.fieldStackView.addGestureRecognizer(singleTapGestureRecognizer)
        addKeyboardNotifications()
        makeDoneButtonToKeyboard()
    }
    
    private func addKeyboardNotifications() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(setKeyboardShow(_:)),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(setKeyboardHide(_:)),
                                               name: UIResponder.keyboardWillHideNotification,
                                               object: nil)
    }
    
    @objc private func setKeyboardShow(_ notification: Notification) {
        self.editRegistrationView.mainScrollView.contentOffset.y = 0
        
        guard let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey]
                as? NSValue else { return }
        
        let keyboardHeight = keyboardFrame.cgRectValue.height
        
        self.editRegistrationView.mainScrollView.contentInset.bottom = keyboardHeight
        
        if self.editRegistrationView.productDescriptionTextView.isFirstResponder {
            self.editRegistrationView.mainScrollView.contentOffset.y += keyboardHeight
        }
    }
    
    @objc private func setKeyboardHide(_ notification: Notification) {
        guard let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey]
                as? NSValue else { return }
        
        let keyboardHeight = keyboardFrame.cgRectValue.height
        
        self.editRegistrationView.mainScrollView.contentInset.bottom -= keyboardHeight
    }
    
    @objc private func hideKeyBoard() {
        self.view.endEditing(true)
    }
    
    private func makeDoneButtonToKeyboard() {
        let toolBar = UIToolbar()
        let barButton = UIBarButtonItem(barButtonSystemItem: .done,
                                        target: self,
                                        action: #selector(hideKeyBoard))
        
        toolBar.sizeToFit()
        toolBar.items = [barButton]
        
        [editRegistrationView.productNameTextField,
         editRegistrationView.productPriceTextField,
         editRegistrationView.productDiscountPriceTextField,
         editRegistrationView.stockTextField].forEach {
            $0.inputAccessoryView = toolBar
        }
        
        editRegistrationView.productDescriptionTextView.inputAccessoryView = toolBar
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView){
        self.view?.endEditing(true)
        setKeyboardHide(Notification(name: UIResponder.keyboardWillHideNotification))
    }
}

//MARK: - TextView PlaceHolder
extension EditRegistrationViewController: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.text == "상세내용" {
            textView.text = nil
            textView.textColor = .black
        }
    }
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            textView.text = "상세내용"
            textView.textColor = .systemGray3
        }
    }
}

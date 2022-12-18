//
//  EditRegistrationViewController.swift
//  OpenMarket
//
//  Created by 써니쿠키 on 2022/12/10.
//

import UIKit

final class EditRegistrationViewController: UIViewController, registrationViewController {
    let page: Page
    var registrationView: RegistrationView!
    
    init(page: Page) {
        self.page = page
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        registrationView = RegistrationView()
        self.view = registrationView
        setupNavigationBar()
        controlKeyBoard()
        configureEditRegistrationView()
        
        registrationView.productDescriptionTextView.delegate = self
        registrationView.mainScrollView.delegate = self
        registrationView.imageCollectionView.delegate = self
        registrationView.imageCollectionView.dataSource = self
        registrationView.imageCollectionView.register(
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
        let marketURLSessionProvider = MarketURLSessionProvider()
        let encoder = JSONEncoder()
        let editedProduct = createProductFromUserInput()
        
        encoder.keyEncodingStrategy = .convertToSnakeCase
        
        guard let url = Request.productEdit(productId: page.id).url else {
            print(NetworkError.generateUrlFailError.localizedDescription)
            return
        }
        
        guard let editedProductData = try? encoder.encode(editedProduct) else {
            print(NetworkError.parameterEncodingFailError.localizedDescription)
            return
        }
        
        let request = RequestManager().generateRequest(
            url: url,
            httpMethod: .patch,
            headers: ["identifier": Request.identifier, "Content-Type": "application/json"],
            bodyData: editedProductData)
        
        marketURLSessionProvider.requestDataTask(of: request) { result in
            switch result {
            case .success:
                DispatchQueue.main.async {
                    self.navigationController?.popViewController(animated: true)
                }
            case .failure(let error):
                print(error.localizedDescription)
                CustomAlert.showAlert(message: "수정 업로드 실패입니다. 다시 시도해 주세요", target: self)
            }
        }
    }
    
    private func configureEditRegistrationView() {
        guard let editRegistrationView = registrationView else {
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
        
        registrationView.fieldStackView.addGestureRecognizer(singleTapGestureRecognizer)
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
        self.registrationView.mainScrollView.contentOffset.y = 0
        
        guard let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey]
                as? NSValue else { return }
        
        let keyboardHeight = keyboardFrame.cgRectValue.height
        
        self.registrationView.mainScrollView.contentInset.bottom = keyboardHeight
        
        if self.registrationView.productDescriptionTextView.isFirstResponder {
            self.registrationView.mainScrollView.contentOffset.y += keyboardHeight
        }
    }
    
    @objc private func setKeyboardHide(_ notification: Notification) {
        guard let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey]
                as? NSValue else { return }
        
        let keyboardHeight = keyboardFrame.cgRectValue.height
        
        self.registrationView.mainScrollView.contentInset.bottom -= keyboardHeight
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
        
        [registrationView.productNameTextField,
         registrationView.productPriceTextField,
         registrationView.productDiscountPriceTextField,
         registrationView.stockTextField].forEach {
            $0.inputAccessoryView = toolBar
        }
        
        registrationView.productDescriptionTextView.inputAccessoryView = toolBar
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

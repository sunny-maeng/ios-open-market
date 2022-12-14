//
//  NewRegistrationViewController.swift
//  OpenMarket
//
//  Created by 써니쿠키, 메네 on 2022/12/01.
//

import UIKit

class NewRegistrationViewController: UIViewController, registrationViewController {
    var registrationView: RegistrationView!
    private var selectedImages: [UIImage] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        registrationView = RegistrationView()
        self.view = registrationView
        setupNavigationBar()
        controlKeyBoard()
        
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
                                     action: #selector(registerProduct))
        
        navigationItem.title = "상품등록"
        navigationItem.rightBarButtonItem  = button
    }
    
    @objc private func registerProduct() {
        let marketURLSessionProvider = MarketURLSessionProvider()
        let encoder = JSONEncoder()
        let product = createProductFromUserInput()
        
        encoder.keyEncodingStrategy = .convertToSnakeCase
        
        guard let productData = try? encoder.encode(product) else {
            print(NetworkError.parameterEncodingFailError.localizedDescription)
            return
        }
        
        guard let request = RequestManager().generateMultiPartFormDataRequest(
            textParameters: ["params": productData],
            imageKey: "images",
            images: selectedImages) else {
            print(NetworkError.generateRequestFailError)
            return
        }
        
        marketURLSessionProvider.requestDataTask(of: request) { result in
            switch result {
            case .success:
                DispatchQueue.main.async {
                    self.navigationController?.popViewController(animated: true)
                }
            case .failure(let error):
                print(error.localizedDescription)
                CustomAlert.showAlert(message: "업로드 실패입니다. 다시 시도해 주세요", target: self)
            }
        }
    }
}

//MARK: - CollectionView
extension NewRegistrationViewController: UICollectionViewDelegate,
                                         UICollectionViewDataSource,
                                         UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return selectedImages.count + 1
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: RegisterImageCell.identifier,
            for: indexPath
        ) as? RegisterImageCell else {
            return UICollectionViewCell()
        }
        
        switch indexPath.item {
        case selectedImages.count:
            cell.setUpPlusImage()
        default:
            var image = selectedImages[indexPath.item]
            
            if let data = image.jpegData(compressionQuality: 1),
               Double(NSData(data: data).count) / 1000.0 > 300 {
                image = image.resize()
            }
            
            cell.setUpImage(image: image)
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.height * 0.8,
                      height: collectionView.frame.height * 0.8)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard indexPath.item == selectedImages.count else { return }
        showImagePicker()
    }
}

//MARK: - ImagePicker
extension NewRegistrationViewController: UIImagePickerControllerDelegate,
                                         UINavigationControllerDelegate {
    private func showImagePicker() {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = true
        imagePicker.delegate = self
        
        present(imagePicker, animated: true)
    }
    
    func imagePickerController(
        _ picker: UIImagePickerController,
        didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            guard selectedImages.count < 5 else {
                dismiss(animated: true)
                CustomAlert.showAlert(message: "사진은 5장까지만 등록할 수 있습니다", target: self)
                return
            }
            
            guard let image = info[.editedImage] as? UIImage else { return }
            
            selectedImages.append(image)
            dismiss(animated: true)
            registrationView.imageCollectionView.reloadData()
        }
}

//MARK: - control Keyboard
extension NewRegistrationViewController: UIScrollViewDelegate {
    private func controlKeyBoard() {
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
extension NewRegistrationViewController: UITextViewDelegate {
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

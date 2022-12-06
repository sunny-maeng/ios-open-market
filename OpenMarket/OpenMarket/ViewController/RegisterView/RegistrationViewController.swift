//
//  RegistrationViewController.swift
//  OpenMarket
//
//  Created by 써니쿠키, 메네 on 2022/12/01.
//

import UIKit

class RegistrationViewController: UIViewController {
    let registrationView: RegistrationView = RegistrationView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view = registrationView
        setupNavigationBar()
        controlKeyBoard()
        
        registrationView.textView.delegate = self
        registrationView.mainScrollView.delegate = self
        registrationView.imageCollectionView.delegate = self
        registrationView.imageCollectionView.dataSource = self
        registrationView.imageCollectionView.register(
            ImageCollectionViewCell.self,
            forCellWithReuseIdentifier: ImageCollectionViewCell.identifier
        )
    }
    
    func setupNavigationBar() {
        let button = UIBarButtonItem(title: "Done",
                                     style: .plain,
                                     target: self,
                                     action: #selector(registerProduct))
        
        navigationItem.title = "상품등록"
        navigationItem.rightBarButtonItem  = button
    }
    
    @objc func registerProduct() {
    }
}

//MARK: - CollectionView
extension RegistrationViewController: UICollectionViewDelegate,
                                      UICollectionViewDataSource,
                                      UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return registrationView.selectedImage.count + 1
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: ImageCollectionViewCell.identifier,
            for: indexPath
        ) as? ImageCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        switch indexPath.item {
        case registrationView.selectedImage.count:
            cell.setUpPlusImage()
        default:
            var image = registrationView.selectedImage[indexPath.item]
            
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
        guard indexPath.item == registrationView.selectedImage.count else { return }
        showImagePicker()
    }
}

//MARK: - ImagePicker
extension RegistrationViewController: UIImagePickerControllerDelegate,
                                      UINavigationControllerDelegate {
    func showImagePicker() {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = true
        imagePicker.delegate = self
        
        present(imagePicker, animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard registrationView.selectedImage.count < 5 else {
            dismiss(animated: true)
            return
        }
        
        guard let image = info[.editedImage] as? UIImage else { return }
        
        registrationView.selectedImage.append(image)
        dismiss(animated: true)
        registrationView.imageCollectionView.reloadData()
    }
}

//MARK: - control Keyboard
extension RegistrationViewController: UIScrollViewDelegate {
    func controlKeyBoard () {
        let singleTapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(hideKeyBoard))
        
        registrationView.fieldStackView.addGestureRecognizer(singleTapGestureRecognizer)
        addKeyboardNotifications()
        makeDoneButtonToKeyboard()
    }
    
    func addKeyboardNotifications() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(setKeyboardShow(_:)),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(setKeyboardHide(_:)),
                                               name: UIResponder.keyboardWillHideNotification,
                                               object: nil)
    }
    
    @objc func setKeyboardShow(_ notification: Notification) {
        self.registrationView.mainScrollView.contentOffset.y = 0
        
        guard let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey]
                as? NSValue else { return }
        
        let keyboardHeight = keyboardFrame.cgRectValue.height
        
        self.registrationView.mainScrollView.contentInset.bottom = keyboardHeight
        self.registrationView.mainScrollView.contentOffset.y +=
        self.registrationView.textView.isFirstResponder ?
        keyboardHeight : 0
    }
    
    @objc func setKeyboardHide(_ notification: Notification) {
        guard let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey]
                as? NSValue else { return }
        
        let keyboardHeight = keyboardFrame.cgRectValue.height
        
        self.registrationView.mainScrollView.contentInset.bottom -= keyboardHeight
    }
    
    @objc func hideKeyBoard() {
        self.view.endEditing(true)
    }
    
    func makeDoneButtonToKeyboard() {
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
        
        registrationView.textView.inputAccessoryView = toolBar
    }    
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView){
        self.view?.endEditing(true)
        setKeyboardHide(Notification(name: UIResponder.keyboardWillHideNotification))
    }
}

//MARK: - TextView PlaceHolder
extension RegistrationViewController: UITextViewDelegate {
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

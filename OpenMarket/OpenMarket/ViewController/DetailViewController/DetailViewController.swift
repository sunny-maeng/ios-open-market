//
//  DetailViewController.swift
//  OpenMarket
//
//  Created by 맹선아 on 2022/12/10.
//

import UIKit

final class DetailViewController: UIViewController {
    private let pageId: Int
    private var page: Page?
    private var detailView: DetailView!
    
    init(pageId: Int) {
        self.pageId = pageId
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        detailView = DetailView()
        self.view = detailView
        fetchPageData(of: pageId)
        self.detailView.imageCollectionView.delegate = self
        self.detailView.imageCollectionView.register(
            DetailImageCell.self,
            forCellWithReuseIdentifier: DetailImageCell.identifier)
        self.setupNavigationBar()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchPageData(of: pageId)
    }
    
    private func fetchPageData(of pageId: Int) {
        let marketURLSessionProvider = MarketURLSessionProvider()
        
        guard let url = Request.productDetail(productNumber: pageId).url else {
            print(NetworkError.generateUrlFailError)
            return
        }
        
        marketURLSessionProvider.requestDataTask(of: URLRequest(url: url)) { result in
            switch result {
            case .success(let data):
                guard let pageData = JSONDecoder.decodeFromSnakeCase(type: Page.self,
                                                                     from: data) else {
                    print(NetworkError.dataDecodingFailError.localizedDescription)
                    return
                }
                
                self.page = pageData
                DispatchQueue.main.async {
                    self.detailView.imageCollectionView.dataSource = self
                    self.configureDetailView()
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }

    private func setupNavigationBar() {
        let actionImage = UIImage(systemName: "square.and.arrow.up")
        let button = UIBarButtonItem(image: actionImage,
                                     style: .plain,
                                     target: self,
                                     action: #selector(showEditOrDeleteActionSheet))
        
        navigationItem.title = "상품상세"
        navigationItem.rightBarButtonItem  = button
    }
    
    @objc private func showEditOrDeleteActionSheet() {
        let alert = UIAlertController()
        let editAction = UIAlertAction(title: "수정", style: .default) { _ in
            guard let page = self.page else { return }

            self.navigationController?.pushViewController(
                EditRegistrationViewController(page: page),
                animated: true)
        }
        
        let deleteAction = UIAlertAction(title: "삭제", style: .destructive) { _ in
            self.searchProductDeleteUri()
        }
        
        let cancelAction = UIAlertAction(title: "취소", style: .cancel)
        
        [editAction, deleteAction, cancelAction].forEach {
            alert.addAction($0)
        }
        
        present(alert, animated: true)
    }
 
    private func searchProductDeleteUri() {
        let marketURLSessionProvider = MarketURLSessionProvider()
        
        guard let url = Request.productDeleteUriInquiry(productId: page?.id ?? 0).url else {
            print(NetworkError.generateUrlFailError.localizedDescription)
            return
        }
        
        print(url)

        guard let secretData = try? JSONSerialization.data(
            withJSONObject: ["secret": "36k448andjvwgavb"]) else {
            print(NetworkError.parameterEncodingFailError.localizedDescription)
            return
        }
        
        let request = RequestManager().generateRequest(
            url: url,
            httpMethod: .post,
            headers: ["identifier": Request.identifier, "Content-Type": "application/json"],
            bodyData: secretData)
        
        marketURLSessionProvider.requestDataTask(of: request) { result in
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    guard let uri = String(data: data, encoding: .utf8) else { return }
                    self.deleteProduct(uri: uri)
                }
            case .failure(let error):
                print(error.localizedDescription)
                CustomAlert.showAlert(message: "수정 업로드 실패입니다. 다시 시도해 주세요", target: self)
            }
        }
    }
    
    private func deleteProduct(uri: String) {
        let marketURLSessionProvider = MarketURLSessionProvider()
        
        guard let url = Request.productDelete(url: uri).url else {
            print(NetworkError.generateUrlFailError.localizedDescription)
            return
        }
        
        print(url)
        
        let request = RequestManager().generateRequest(
            url: url,
            httpMethod: .delete,
            headers: ["identifier": Request.identifier],
            bodyData: nil)
    
        marketURLSessionProvider.requestDataTask(of: request) { result in
            switch result {
            case .success:
                DispatchQueue.main.async {
                    self.navigationController?.popViewController(animated: true)
                }
            case .failure(let error):
                print(error.localizedDescription)
                CustomAlert.showAlert(message: "삭제 실패입니다. 다시 시도해 주세요", target: self)
            }
        }
    }
    
    private func configureDetailView() {
        guard let detailView = detailView else {
            return
        }
        
        detailView.productNameLabel.text = page?.name
        detailView.descriptionTextView.text = page?.description
        configureStockLabel()
        configurePriceLabel()
    }

    private func configurePriceLabel() {
        guard let page = page else { return }
        
        let price: Any = page.currency == .krw ? Int(page.price) : page.price
        let bargainPrice: Any = page.currency == .krw ? Int(page.bargainPrice) : page.bargainPrice
        
        if page.discountedPrice > 0  {
            detailView.priceLabel.attributedText = NSMutableAttributedString()
                .strikethrough(string: "\(page.currency.rawValue) \(price)")
                .normal(string: "\n\(page.currency.rawValue) \(bargainPrice)")
        } else {
            detailView.priceLabel.attributedText = NSMutableAttributedString()
                .normal(string: "\(page.currency.rawValue) \(price)")
        }
    }
    
    private func configureStockLabel() {
        if page?.stock == 0 {
            detailView.stockLabel.attributedText = NSMutableAttributedString()
                .orangeColor(string: "품절")
        } else {
            detailView.stockLabel.attributedText = NSMutableAttributedString()
                .normal(string: "남은 수량: \(page?.stock ?? 0)")
        }
    }
}

extension DetailViewController: UICollectionViewDelegate,
                                UICollectionViewDataSource,
                                UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return page?.images?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: DetailImageCell.identifier,
            for: indexPath) as? DetailImageCell,
              let page = page else {
            return UICollectionViewCell()
        }
 
        cell.fetchImage(page: page, index: indexPath.item)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width,
                      height: collectionView.frame.height)
    }
}

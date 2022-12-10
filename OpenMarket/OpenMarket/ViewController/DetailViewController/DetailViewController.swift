//
//  DetailViewController.swift
//  OpenMarket
//
//  Created by 맹선아 on 2022/12/10.
//

import UIKit

class DetailViewController: UIViewController {
    let pageId: Int
    var page: Page?
    var detailView: DetailView!
    
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
    
    private func setupNavigationBar() {
        let actionImage = UIImage(systemName: "square.and.arrow.up")
        let button = UIBarButtonItem(image: actionImage,
                                     style: .plain,
                                     target: self,
                                     action: #selector(showEditOrDeleteActionSheet))
        
        navigationItem.title = "상품상세"
        navigationItem.rightBarButtonItem  = button
    }
    
    func configureDetailView() {
        guard let detailView = detailView else {
            return
        }
        
        detailView.productNameLabel.text = page?.name
        detailView.descriptionTextView.text = page?.description
        configureStockLabel()
        configurePriceLabel()
    }
    
    @objc func showEditOrDeleteActionSheet() {
        let alert = UIAlertController()
        let editAction = UIAlertAction(title: "수정", style: .default)
        let deleteAction = UIAlertAction(title: "삭제", style: .destructive)
        let cancelAction = UIAlertAction(title: "취소", style: .cancel)
        
        [editAction, deleteAction, cancelAction].forEach {
            alert.addAction($0)
        }
        
        present(alert, animated: true)
    }
    
    init(pageId: Int) {
        self.pageId = pageId
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func fetchPageData(of pageId: Int) {
        let marketURLSessionProvider = MarketURLSessionProvider()
        
        guard let url = Request.productDetail(productNumber: pageId).url else {
            print(NetworkError.generateUrlFailError)
            return
        }
        
        marketURLSessionProvider.fetchData(request: URLRequest(url: url)) { result in
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
    
    func configurePriceLabel() {
        guard let page = page else {
            return
        }

        if page.discountedPrice > 0  {
            detailView.priceLabel.attributedText = NSMutableAttributedString()
                .strikethrough(string: "\(page.currency.rawValue) \(page.price)")
                .normal(string: "\n\(page.currency.rawValue) \(page.bargainPrice)")
        } else {
            detailView.priceLabel.attributedText = NSMutableAttributedString()
                .normal(string: "\(page.currency.rawValue) \(page.price)")
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

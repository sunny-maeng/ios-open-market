//
//  RegisterImageCell.swift
//  OpenMarket
//
//  Created by 써니쿠키, 메네 on 2/12/2022.
//

import UIKit

final class RegisterImageCell: UICollectionViewCell {
    static let identifier = "RegisterImageCell"
    
    private let addImage: UIImage = {
        guard let image = UIImage(systemName: "plus") else { return UIImage() }
        
        return image
    }()
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .systemGray6
        
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(imageView)
        
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpPlusImage() {
        imageView.image = addImage
        imageView.contentMode = .center
    }
    
    func setUpImage(image: UIImage) {
        imageView.image = image
        imageView.contentMode = .scaleAspectFit
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: self.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
    }
    
    func fetchImage(page: Page,
                    index: Int) {
        guard let imageUrl = page.images?[index].url else {
            print(NetworkError.generateUrlFailError.localizedDescription)
            return
        }
        let cacheKey = NSString(string: imageUrl)
        let session = MarketURLSessionProvider()
        
        if let cachedImage = ImageCacheProvider.shared.object(forKey: cacheKey) {
            self.imageView.image = cachedImage
        } else {
            guard let imageUrl = URL(string: imageUrl) else {
                print(NetworkError.generateUrlFailError.localizedDescription)
                return
            }
            
            session.requestDataTask(of: URLRequest(url: imageUrl)) { result in
                switch result {
                case .success(let data):
                    DispatchQueue.main.async {
                        guard let image = UIImage(data: data) else {
                            print(NetworkError.generateImageDataFailError.localizedDescription)
                            return
                        }
                        
                        ImageCacheProvider.shared.setObject(image, forKey: cacheKey)
                        self.imageView.image = image
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
}

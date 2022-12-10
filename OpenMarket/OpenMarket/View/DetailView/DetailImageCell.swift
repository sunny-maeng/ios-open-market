//
//  DetailImageCell.swift
//  OpenMarket
//
//  Created by 써니쿠키 on 2022/12/10.
//

import UIKit

class DetailImageCell: UICollectionViewCell {
    static let identifier = "DetialImageCell"
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }()
    
    let imageNumberLabel: CustomLabel = CustomLabel(textAlignment: .center,
                                                    font: .preferredFont(forTextStyle: .footnote))
    
    let stackView: CustomStackView = CustomStackView(axis: .vertical,
                                                     alignment: .center,
                                                     spacing: 10)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupLayout() {
        [imageView,
         imageNumberLabel].forEach {
            stackView.addArrangedSubview($0)
        }
        stackView.setContentCompressionResistancePriority(.required,
                                                          for: .vertical)
        self.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            imageView.widthAnchor.constraint(equalTo: stackView.widthAnchor),
            imageView.heightAnchor.constraint(lessThanOrEqualTo: imageView.widthAnchor),
            
            stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            stackView.topAnchor.constraint(equalTo: self.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
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
            let labelText = "\(index+1)/\(page.images?.count ?? 0)"
            configureCell(image: cachedImage, labelText: labelText)
        } else {
            guard let imageUrl = URL(string: imageUrl) else {
                print(NetworkError.generateUrlFailError.localizedDescription)
                return
            }

            session.fetchData(request: URLRequest(url: imageUrl)) { result in
                switch result {
                case .success(let data):
                    DispatchQueue.main.async {
                        guard let image = UIImage(data: data) else {
                            print(NetworkError.generateImageDataFailError.localizedDescription)
                            return
                        }
                        let labelText = "\(index+1)/\(page.images?.count ?? 0)"

                        ImageCacheProvider.shared.setObject(image, forKey: cacheKey)
                        self.configureCell(image: image, labelText: labelText)
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    func configureCell(image: UIImage, labelText: String) {
        self.imageView.image = image
        self.imageNumberLabel.text = labelText
    }
}

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
    
    func setUpPlusImage() {
        imageView.image = addImage
        imageView.contentMode = .center
    }
    
    func setUpImage(image: UIImage) {
        imageView.image = image
        imageView.contentMode = .scaleAspectFit
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(imageView)
        
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupLayout() {
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: self.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
    }
}

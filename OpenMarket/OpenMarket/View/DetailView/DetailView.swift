//
//  DetailView.swift
//  OpenMarket
//
//  Created by 맹선아 on 2022/12/09.
//

import UIKit

final class DetailView: UIView {
    let imagesCollectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        
        flowLayout.scrollDirection = .horizontal
        flowLayout.sectionInset = .init(top: 10, left: 10, bottom: 10, right: 10)

        collectionView.translatesAutoresizingMaskIntoConstraints = false

        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .systemBackground
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

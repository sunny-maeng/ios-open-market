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
    
    let productNameLabel: CustomLabel = CustomLabel(font: .preferredFont(forTextStyle: .title2))
    let stockLabel: CustomLabel = CustomLabel(textAlignment: .right,
                                              font: .preferredFont(forTextStyle: .body))
    let priceLabel: CustomLabel = CustomLabel(textAlignment: .right,
                                              font: .preferredFont(forTextStyle: .body))
    let descriptionTextView: UITextView = {
        let textView = UITextView()
        
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.isScrollEnabled = true
        textView.font = .preferredFont(forTextStyle: .body)
        
        return textView
    }()
    
    let stockAndPriceStackView: CustomStackView = CustomStackView(axis: .vertical,
                                                                  distribution: .fill,
                                                                  alignment: .trailing,
                                                                  spacing: 10)
    
    let nameAndStockAndPriceStackView: CustomStackView = CustomStackView(axis: .horizontal,
                                                                  spacing: 10)
    let mainStackView: CustomStackView = CustomStackView(axis: .vertical,
                                                        spacing: 10)
    let mainScrollView: UIScrollView = {
        let scrollview = UIScrollView()

        scrollview.translatesAutoresizingMaskIntoConstraints = false
        scrollview.showsVerticalScrollIndicator = false

        return scrollview

    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .systemBackground
        setupLayout()
        //test
//        priceLabel.text = "productPrice"
//        productNameLabel.text = "productName"
//        stockLabel.text = "producStock"
//        descriptionTextView.text = "description"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        [stockLabel,
         priceLabel].forEach {
            stockAndPriceStackView.addArrangedSubview($0)
        }
        
        [productNameLabel,
         stockAndPriceStackView].forEach {
            nameAndStockAndPriceStackView.addArrangedSubview($0)
        }
        
        [imagesCollectionView,
        nameAndStockAndPriceStackView,
         descriptionTextView].forEach {
            mainStackView.addArrangedSubview($0)
        }
        
        mainScrollView.addSubview(mainStackView)
        
        self.addSubview(mainScrollView)
        
        NSLayoutConstraint.activate([
            imagesCollectionView.topAnchor.constraint(
                equalTo: mainStackView.topAnchor),
            imagesCollectionView.leadingAnchor.constraint(
                equalTo: mainStackView.leadingAnchor),
            imagesCollectionView.trailingAnchor.constraint(
                equalTo: mainStackView.trailingAnchor),
            imagesCollectionView.heightAnchor.constraint(
                equalTo: self.safeAreaLayoutGuide.heightAnchor,
                multiplier: 0.4),
            
            productNameLabel.widthAnchor.constraint(
                greaterThanOrEqualTo: self.mainStackView.widthAnchor,
                multiplier: 0.6),
            
            nameAndStockAndPriceStackView.heightAnchor.constraint(
                equalTo: self.safeAreaLayoutGuide.heightAnchor,
                multiplier: 0.15),
            
            descriptionTextView.heightAnchor.constraint(
                greaterThanOrEqualTo: self.safeAreaLayoutGuide.heightAnchor,
                multiplier: 0.45),
            
            mainStackView.leadingAnchor.constraint(
                equalTo: mainScrollView.frameLayoutGuide.leadingAnchor),
            mainStackView.trailingAnchor.constraint(
                equalTo: mainScrollView.frameLayoutGuide.trailingAnchor),
            mainStackView.topAnchor.constraint(
                equalTo: mainScrollView.topAnchor),
            mainStackView.bottomAnchor.constraint(
                equalTo: mainScrollView.bottomAnchor),

            mainScrollView.frameLayoutGuide.leadingAnchor.constraint(
                equalTo: self.safeAreaLayoutGuide.leadingAnchor,
                constant: 10),
            mainScrollView.frameLayoutGuide.trailingAnchor.constraint(
                equalTo: self.safeAreaLayoutGuide.trailingAnchor,
                constant: -10),
            mainScrollView.frameLayoutGuide.topAnchor.constraint(
                equalTo: self.safeAreaLayoutGuide.topAnchor),
            mainScrollView.frameLayoutGuide.bottomAnchor.constraint(
                equalTo: self.safeAreaLayoutGuide.bottomAnchor),

            mainScrollView.contentLayoutGuide.leadingAnchor.constraint(
                equalTo: mainScrollView.frameLayoutGuide.leadingAnchor),
            mainScrollView.contentLayoutGuide.trailingAnchor.constraint(
                equalTo: mainScrollView.frameLayoutGuide.trailingAnchor),
        ])
    }
}

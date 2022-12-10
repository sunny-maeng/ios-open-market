//
//  DetailView.swift
//  OpenMarket
//
//  Created by 써니쿠키 on 2022/12/09.
//

import UIKit

final class DetailView: UIView {
    let imageCollectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        
        flowLayout.scrollDirection = .horizontal

        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsHorizontalScrollIndicator = false
  
        return collectionView
    }()
    
    let productNameLabel: CustomLabel = CustomLabel(font: .systemFont(ofSize: 25, weight: .medium),
                                                    numberOfLines: 0)
    let stockLabel: CustomLabel = CustomLabel(textAlignment: .right,
                                              font: .systemFont(ofSize: 20, weight: .light),
                                              textColor: .systemGray)
    let priceLabel: CustomLabel = CustomLabel(textAlignment: .right,
                                              font: .systemFont(ofSize: 20, weight: .regular),
                                              numberOfLines: 0)
    let descriptionTextView: UITextView = {
        let textView = UITextView()
        
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.isScrollEnabled = false
        textView.font = .preferredFont(forTextStyle: .body)
        
        return textView
    }()
    
    let stockAndPriceStackView: CustomStackView = CustomStackView(axis: .vertical,
                                                                  distribution: .fill,
                                                                  alignment: .trailing,
                                                                  spacing: 10)
    
    let nameAndStockAndPriceStackView: CustomStackView = CustomStackView(axis: .horizontal,
                                                                         alignment: .top,
                                                                         spacing: 5)
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
        
        [imageCollectionView,
         nameAndStockAndPriceStackView,
         descriptionTextView].forEach {
            mainStackView.addArrangedSubview($0)
        }
        
        mainScrollView.addSubview(mainStackView)
        self.addSubview(mainScrollView)
        stockLabel.setContentHuggingPriority(.init(rawValue: 1), for: .vertical)
        
        NSLayoutConstraint.activate([
            imageCollectionView.topAnchor.constraint(
                equalTo: mainStackView.topAnchor),
            imageCollectionView.leadingAnchor.constraint(
                equalTo: mainStackView.leadingAnchor),
            imageCollectionView.trailingAnchor.constraint(
                equalTo: mainStackView.trailingAnchor),
            imageCollectionView.heightAnchor.constraint(equalTo: imageCollectionView.widthAnchor, multiplier: 1.1),
            
            productNameLabel.widthAnchor.constraint(
                greaterThanOrEqualTo: self.mainStackView.widthAnchor,
                multiplier: 0.6),
 
            descriptionTextView.bottomAnchor.constraint(
                equalTo: mainScrollView.bottomAnchor),
            
            mainStackView.leadingAnchor.constraint(
                equalTo: mainScrollView.leadingAnchor),
            mainStackView.trailingAnchor.constraint(
                equalTo: mainScrollView.trailingAnchor),
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

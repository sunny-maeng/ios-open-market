//
//  MainView.swift
//  OpenMarket
//
//  Created by 써니쿠키 on 2023/03/21.
//

import UIKit

enum MainViewLayoutType {

    case list, grid
}

final class MainView: UIView {

    private(set) var currentLayoutType: MainViewLayoutType {
        didSet { layout(for: currentLayoutType) }
    }

    private(set) var collectionView: UICollectionView = {
        let layout = UICollectionViewLayout()
        let collectionView: UICollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        return collectionView
    }()

    init (layoutType: MainViewLayoutType = .list) {
        self.currentLayoutType = layoutType
        super.init(frame: .zero)
        configureViewHierarchy()
        configureViewLayout()
        layout(for: currentLayoutType)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func changeLayout(to layoutType: MainViewLayoutType) {
        self.currentLayoutType = layoutType
    }

    private func layout(for layoutType: MainViewLayoutType) {
        switch layoutType {
        case.list:
            configureListView()
        case.grid:
            configureGridLayout()
        }
        
        collectionView.setContentOffset(.zero, animated: false)
    }

    // ListType
    private func configureListView() {
        collectionView.setCollectionViewLayout(createListLayout(), animated: true)
    }

    private func createListLayout() -> UICollectionViewCompositionalLayout {
        let config = UICollectionLayoutListConfiguration(appearance: .plain)
        return UICollectionViewCompositionalLayout.list(using: config)
    }

    // GridType
    private func configureGridLayout() {
        collectionView.setCollectionViewLayout(generateGridLayout(), animated: true)
    }

    private func generateGridLayout() -> UICollectionViewCompositionalLayout {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                              heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)

        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(350))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 2)

        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10)

        let layout = UICollectionViewCompositionalLayout(section: section)

        return layout
    }

    private func configureViewHierarchy() {
        self.addSubview(collectionView)
    }

    private func configureViewLayout() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor)
        ])
    }
}

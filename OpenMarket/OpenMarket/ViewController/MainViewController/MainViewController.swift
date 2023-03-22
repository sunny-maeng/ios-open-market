//
// MainViewController.swift
// OpenMarket
//
//  Created by 써니쿠키, 메네 on 2022/11/22.
//

import UIKit

final class MainViewController: UIViewController {

    private typealias Snapshot = NSDiffableDataSourceSnapshot<Section, Page>
    private typealias DataSource = UICollectionViewDiffableDataSource<Section, Page>

    private let mainView: MainView = MainView()
    private var pageData: [Page] = []
    private var dataSource: DataSource?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        makeBarButton()
        setUpSegmentControl()
        fetchMarketData()
        configureDataSource()
        applyInitialSnapshot()
    }

    private func setupView() {
        mainView.collectionView.delegate = self
        self.view = mainView
        self.view.backgroundColor = .systemBackground
    }

    private func fetchMarketData() {
        let marketURLSessionProvider = MarketURLSessionProvider()

        guard let url = Request.productList(pageNumber: 1, itemsPerPage: 100).url else {
            print(NetworkError.generateUrlFailError)
            return
        }

        marketURLSessionProvider.requestDataTask(of: URLRequest(url: url)) { result in
            switch result {
            case .success(let data):
                guard let marketData = JSONDecoder.decodeFromSnakeCase(type: Market.self, from: data) else {
                    print(NetworkError.dataDecodingFailError.localizedDescription)
                    return
                }

                DispatchQueue.main.sync {
                    self.pageData = marketData.pages
                    self.applySnapshot()
                }

            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }

    private func configureDataSource() {
        let listCellRegistration = UICollectionView.CellRegistration<MarketListCell, Page> { (cell, indexPath, page) in
            cell.configureCell(page: page) { updateConfiguration in
                if indexPath == self.mainView.collectionView.indexPath(for: cell) {
                    updateConfiguration()
                }
            }
        }

        let gridCellRegistration = UICollectionView.CellRegistration<MarketGridCell, Page> { (cell, indexPath, page) in
            cell.configureCell(page: page) { updateImage in
                if indexPath == self.mainView.collectionView.indexPath(for: cell) {
                    updateImage()
                }
            }
        }

        dataSource = DataSource(collectionView: mainView.collectionView) {
            (collectionView, indexPath, page) -> UICollectionViewCell? in
            switch self.mainView.currentLayoutType {
            case .list:
                return collectionView.dequeueConfiguredReusableCell(using: listCellRegistration,
                                                                    for: indexPath,
                                                                    item: page)
            case .grid:
                return collectionView.dequeueConfiguredReusableCell(using: gridCellRegistration,
                                                                    for: indexPath,
                                                                    item: page)
            }
        }
    }

    private func applyInitialSnapshot() {
        var snapshot = Snapshot()

        snapshot.appendSections([.productList])
        snapshot.appendItems(pageData)
        dataSource?.apply(snapshot)
    }

    private func applySnapshot() {
        guard let dataSource = dataSource else { return }

        var snapshot = dataSource.snapshot()
        snapshot.deleteAllItems()
        snapshot.appendSections([.productList])
        snapshot.appendItems(pageData)
        snapshot.reloadSections([.productList])

        dataSource.apply(snapshot)
    }

    lazy private var segmentedControl: UISegmentedControl = {
        let itemsCount = 2
        let segmentControl: UISegmentedControl = UISegmentedControl(items: Array(repeating: "", count: itemsCount))
        segmentControl.selectedSegmentIndex = 0
        segmentControl.selectedSegmentTintColor = .systemBlue
        segmentControl.setTitleTextAttributes([.foregroundColor: UIColor.white, .backgroundColor: UIColor.systemBlue],
                                              for: .selected)
        segmentControl.setTitleTextAttributes([.foregroundColor: UIColor.systemBlue],
                                              for: .normal)
        segmentControl.translatesAutoresizingMaskIntoConstraints = false

        for index in 0..<itemsCount {
            segmentControl.setWidth(self.view.frame.width * 0.2, forSegmentAt: index)
        }

        return segmentControl
    }()

    private func makeBarButton() {
        let button = UIBarButtonItem(image: UIImage(systemName: "plus"),
                                     style: .plain,
                                     target: self,
                                     action: #selector(touchUpRegisterButton))
        
        navigationItem.rightBarButtonItem  = button
    }
    
    private func setUpSegmentControl() {
        segmentedControl.setAction(showListView(), forSegmentAt: 0)
        segmentedControl.setAction(showGridView(), forSegmentAt: 1)
        segmentedControl.setTitle("LIST", forSegmentAt: 0)
        segmentedControl.setTitle("GRID", forSegmentAt: 1)

        segmentedControl.backgroundColor = .systemBackground
        self.navigationItem.titleView = segmentedControl
    }

    private func showListView() -> UIAction {
        return UIAction { [weak self] _ in

            self?.mainView.changeLayout(to: .list)
            self?.applySnapshot()
        }
    }

    private func showGridView() -> UIAction {
        return UIAction { [weak self] _ in

            self?.mainView.changeLayout(to: .grid)
            self?.applySnapshot()
        }
    }
    
    @objc func touchUpRegisterButton(_ sender: UIBarButtonItem) {
        self.navigationController?.pushViewController(NewRegistrationViewController(), animated: true)
        navigationItem.backButtonTitle = "Cancel"
    }
}

extension MainViewController {
    enum SegmentedItemState: Int {
        case list = 0
        case grid = 1
    }
}

extension MainViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let pageId = pageData[indexPath.item].id
        let detailViewController = DetailViewController(pageId: pageId)
        self.navigationController?.pushViewController(detailViewController, animated: true)
    }
}

extension MainViewController {
    private enum Section {
        case productList
    }
}

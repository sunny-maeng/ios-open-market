//
// MainViewController.swift
// OpenMarket
//
//  Created by 써니쿠키, 메네 on 2022/11/22.
//

import UIKit

final class MainViewController: UIViewController {

    lazy private var listView: UIView = {
        let view: UIView = UIView(frame: self.view.frame)
        view.translatesAutoresizingMaskIntoConstraints = false

        return view
    }()

    lazy private var gridView: UIView = {
        let view: UIView = UIView(frame: self.view.frame)
        view.translatesAutoresizingMaskIntoConstraints = false

        return view
    }()

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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeBarButton()
        setUpSegmentControl()
        self.view = listView
    }
    
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

            self?.view = self?.listView
        }
    }

    private func showGridView() -> UIAction {
        return UIAction { [weak self] _ in
            self?.view = self?.gridView
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

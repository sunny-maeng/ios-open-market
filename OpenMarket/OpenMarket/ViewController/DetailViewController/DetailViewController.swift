//
//  DetailViewController.swift
//  OpenMarket
//
//  Created by 맹선아 on 2022/12/10.
//

import UIKit

class DetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = DetailView(frame: .zero)
        setupNavigationBar()
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
    
    @objc func showEditOrDeleteActionSheet() {
        
    }

}

//
//  ViewController.swift
//  NYArticles
//
//  Created by Intercell Testing on 27/07/19.
//  Copyright © 2019 Intercell Testing. All rights reserved.
//

import UIKit

class NYArticleViewController: UIViewController {
    let networkManager = NetworkManager()
    @IBOutlet weak var articleTable: UITableView!
    fileprivate var viewModel: NYArticleViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        
        articleTable?.rowHeight = UITableView.automaticDimension
        articleTable?.estimatedRowHeight = UITableView.automaticDimension
        
        articleTable?.register(NYAticleCell.nib, forCellReuseIdentifier: NYAticleCell.identifier)
        
        networkManager.getArticles(days: 7, completion: { [weak self] article, error in
            guard let article = article else {
                return
            }
            self?.viewModel = NYArticleViewModel(items: article)
            self?.viewModel.viewController = self
            self?.viewModel.tableView = self?.articleTable
            DispatchQueue.main.async {
                self?.articleTable?.dataSource = self?.viewModel
                self?.articleTable?.reloadData()
            }
        })
    }
}

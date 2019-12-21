//
//  File.swift
//  NYArticles
//
//  Created by Intercell Testing on 27/07/19.
//  Copyright © 2019 Intercell Testing. All rights reserved.
//

import Foundation
import UIKit
class NYArticleViewModel: NSObject {
    var articles = [Article]()
    var tableView: UITableView!
    var viewController: UIViewController!
    
    override init() {
        super.init()
    }
    convenience init(items: [Article]) {
        self.init()
        self.articles = items
    }
}

extension NYArticleViewModel: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return articles.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: NYAticleCell.identifier, for: indexPath) as? NYAticleCell {
            cell.item = articles[indexPath.row]
            return cell
        }
        return UITableViewCell()
    }
}

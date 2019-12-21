//
//  NYAticleCell.swift
//  NYArticles
//
//  Created by Intercell Testing on 27/07/19.
//  Copyright © 2019 Intercell Testing. All rights reserved.
//

import UIKit

class NYAticleCell: UITableViewCell {
    
    @IBOutlet weak var articleImage: UIImageView!
    @IBOutlet weak var headingLabel: UILabel!
    @IBOutlet weak var subHeadingLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        articleImage.layer.cornerRadius = 35.0
        articleImage.clipsToBounds = true
        articleImage.backgroundColor = .gray
    }
    
    static var nib:UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    static var identifier: String {
        return String(describing: self)
    }
    
    var item: Article? {
        didSet {
            headingLabel.text = self.item?.abstract
            subHeadingLabel.text = self.item?.byline
            dateLabel.text = self.item?.publishedDate
        }
    }
    
}

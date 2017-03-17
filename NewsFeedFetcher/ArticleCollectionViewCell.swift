//
//  ArticleCollectionViewCell.swift
//  NewsFeedFetcher
//
//  Created by Chavalit Vanasapdamrong on 3/17/2560 BE.
//  Copyright © 2560 Chavalit Vanasapdamrong. All rights reserved.
//

import UIKit
import Kingfisher

class ArticleCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView?
    @IBOutlet weak var titleLabel: UILabel?
    @IBOutlet weak var descriptionLabel: UILabel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        titleLabel?.adjustsFontSizeToFitWidth = true
    }
    
    func setup(_ article: Article) {
        titleLabel?.text = article.title
        descriptionLabel?.text = article.description
        imageView?.kf.setImage(
            with: URL(string: article.urlToImage),
            placeholder: nil,
            options: nil,
            progressBlock: nil,
            completionHandler: nil
        )
        applyStyle()
    }
    
    private func applyStyle() {
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 5.0)
        self.layer.shadowRadius = 10
        self.layer.shadowOpacity = 0.6
        self.layer.masksToBounds = false
        let rect = CGRect(x: 20, y: 10, width: self.bounds.width - 40, height: self.bounds.height)
        self.layer.shadowPath = UIBezierPath(roundedRect:rect, cornerRadius:self.layer.cornerRadius).cgPath
    }
    
}

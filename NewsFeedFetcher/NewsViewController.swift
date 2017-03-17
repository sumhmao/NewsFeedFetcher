//
//  NewsViewController.swift
//  NewsFeedFetcher
//
//  Created by Chavalit Vanasapdamrong on 3/17/2560 BE.
//  Copyright © 2560 Chavalit Vanasapdamrong. All rights reserved.
//

import UIKit

class NewsViewController: UIViewController, ClearNavigationBarView {
    
    @IBOutlet weak var articlesCollectionView: UICollectionView?
    
    var presenter: NewsPresentation!
    
    var articles: [Article] = [] {
        didSet {
            articlesCollectionView?.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        presenter.viewDidLoad()
    }
    
    private func setupView() {
        setClearNavigationBarStyle()
        navigationItem.title = Localization.Articles.navigationBarTitle
        let backgroundColor = UIColor(red: 0.14, green: 0.46, blue: 0.35, alpha: 1.0)
        view.applyGradientShadowBackground(color: backgroundColor)
        
        articlesCollectionView?.contentInset = UIEdgeInsetsMake(40, 40, 60, 40)
        articlesCollectionView?.register(ArticleCollectionViewCell.self)
    }

}

extension NewsViewController: NewsView {
    
    func showNoContentScreen() {
        
    }
    
    func showArticlesData(_ articles: [Article]) {
        self.articles = articles
    }
}

extension NewsViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.size.width - (collectionView.contentInset.left + collectionView.contentInset.right)
        let height = collectionView.frame.size.height - (collectionView.contentInset.top + collectionView.contentInset.bottom)
        
        return CGSize(width: width, height:height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return (collectionView.contentInset.right / 2)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return articles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(forIndexPath: indexPath) as ArticleCollectionViewCell
        let article = articles[indexPath.row]
        cell.setup(article)
        cell.setNeedsLayout()
        cell.layoutIfNeeded()
        
        return cell
    }
    
}

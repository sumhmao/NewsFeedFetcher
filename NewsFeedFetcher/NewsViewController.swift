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
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        styleGradientBackground()
        styleCollectionView()
        if let carouselLayout = self.articlesCollectionView?.collectionViewLayout as? CarouselCollectionViewLayout {
            let newRect = carouselLayout.rectForIndex(carouselLayout.currentPage)
            self.articlesCollectionView?.contentOffset = CGPoint(x: newRect.origin.x, y: 0)
            self.articlesCollectionView?.reloadData()
        }
    }
    
    @IBAction func didTapRefresh() {
        presenter.didTapRefresh()
    }
    
    private func setupView() {
        setClearNavigationBarStyle()
        navigationItem.title = Localization.Articles.navigationBarTitle
        
        articlesCollectionView?.register(ArticleCollectionViewCell.self)
        articlesCollectionView?.decelerationRate = UIScrollViewDecelerationRateFast
        
        styleGradientBackground()
        styleCollectionView()
    }
    
    private func styleGradientBackground() {
        let backgroundColor = UIColor(red: 0.14, green: 0.46, blue: 0.35, alpha: 1.0)
        view.applyGradientShadowBackground(color: backgroundColor)
    }
    
    private func styleCollectionView() {
        if let carouselLayout = articlesCollectionView?.collectionViewLayout as? CarouselCollectionViewLayout, let collectionView = articlesCollectionView {
            
            carouselLayout.sectionInset = UIEdgeInsetsMake(40, 40, 60, 40)
            
            let width = collectionView.frame.size.width - (carouselLayout.sectionInset.left + carouselLayout.sectionInset.right)
            let height = collectionView.frame.size.height - (carouselLayout.sectionInset.top + carouselLayout.sectionInset.bottom)
            
            carouselLayout.scrollDirection = .horizontal
            carouselLayout.itemSize = CGSize(width: width, height:height)
            carouselLayout.minimumInteritemSpacing = (carouselLayout.sectionInset.right / 2)
        }
    }
    
}

extension NewsViewController: NewsView {
    
    func showNoContentScreen() {
        self.articles = []
    }
    
    func showArticlesData(_ articles: [Article]) {
        self.articles = articles
    }
}

extension NewsViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return articles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(forIndexPath: indexPath) as ArticleCollectionViewCell
        let article = articles[indexPath.row]
        cell.setup(article)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let article = articles[indexPath.row]
        presenter.didSelectArticle(article)
    }
    
}

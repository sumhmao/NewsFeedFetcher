//
//  NewsPresenter.swift
//  NewsFeedFetcher
//
//  Created by Chavalit Vanasapdamrong on 3/17/2560 BE.
//  Copyright © 2560 Chavalit Vanasapdamrong. All rights reserved.
//

import UIKit

class NewsPresenter: NewsPresentation {

    weak var view: NewsView?
    var interactor: NewsUseCase!
    var router: NewsWireframe!
    
    func viewDidLoad() {
        interactor.fetchArticles(from: .TechCrunch)
    }
    
    func didSelectArticle(_ article: Article) {
        
    }
    
}

extension NewsPresenter: NewsInteractorOutput {
 
    func articlesFetched(_ articles: [Article]) {
        view?.showArticlesData(articles)
    }
    
    func articleFetchFailed() {
        view?.showNoContentScreen()
    }
    
}

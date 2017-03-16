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
        
    }
    
    func didSelectNews(_ news: News) {
        
    }
    
}

extension NewsPresenter: NewsInteractorOutput {
 
    func newsFetched(_ news: [News]) {
        
    }
    
    func newsFetchFailed() {
        
    }
    
}

//
//  NewsModuleTests.swift
//  NewsFeedFetcher
//
//  Created by Chavalit Vanasapdamrong on 3/18/2560 BE.
//  Copyright © 2560 Chavalit Vanasapdamrong. All rights reserved.
//

import XCTest
@testable import NewsFeedFetcher

class NewsModuleTests: XCTestCase {
    
    var newsVC: NewsViewController?
    
    override func setUp() {
        super.setUp()
        newsVC = R.storyboard.newsStoryboard.newsViewController()
        let presenter = NewsPresenter()
        let interactor = NewsInteractor()
        let router = NewsRouter()
        
        newsVC?.presenter = presenter
        presenter.view = newsVC
        presenter.interactor = interactor
        presenter.router = router
        interactor.output = presenter
        router.viewController = newsVC
    }
    
    override func tearDown() {
        newsVC = nil
        super.tearDown()
    }
    
    func testMappingAndClearArticles() {
        var articles = [Article]()
        for _ in 0..<5 {
            let article = Article()
            articles.append(article)
        }
        newsVC?.presenter.interactor.output.articlesFetched(articles)
        XCTAssertEqual(articles.count, newsVC?.articles.count)
        
        newsVC?.presenter.interactor.output.articleFetchFailed()
        XCTAssertEqual(newsVC?.articles.count, 0)
    }
    
}

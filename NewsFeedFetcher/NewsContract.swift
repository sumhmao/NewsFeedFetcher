//
//  NewsContract.swift
//  NewsFeedFetcher
//
//  Created by Chavalit Vanasapdamrong on 3/16/2560 BE.
//  Copyright © 2560 Chavalit Vanasapdamrong. All rights reserved.
//

import UIKit

protocol NewsView: IndicatableView {
    var presenter: NewsPresentation! { get set }
    
    func showNoContentScreen()
    func showArticlesData(_ articles: [Article])
}

protocol NewsPresentation: class {
    weak var view: NewsView? { get set }
    var interactor: NewsUseCase! { get set }
    var router: NewsWireframe! { get set }
    
    func viewDidLoad()
    func didSelectArticle(_ article: Article)
}

protocol NewsUseCase: class {
    weak var output: NewsInteractorOutput! { get set }
    
    func fetchArticles(from source: NewsSource)
}

protocol NewsInteractorOutput: class {
    func articlesFetched(_ articles: [Article])
    func articleFetchFailed()
}

protocol NewsWireframe: class {
    weak var viewController: UIViewController? { get set }
    
//    func presentDetails(forArticle article: Article)
    
    static func assembleModule() -> UIViewController
}

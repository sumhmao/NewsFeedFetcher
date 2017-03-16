//
//  NewsContract.swift
//  NewsFeedFetcher
//
//  Created by Chavalit Vanasapdamrong on 3/16/2560 BE.
//  Copyright © 2560 Chavalit Vanasapdamrong. All rights reserved.
//

import UIKit

protocol NewsView: class {
    var presenter: NewsPresentation! { get set }
    
    func showNoContentScreen()
    func showArticlesData(_ articles: [News])
}

protocol NewsPresentation: class {
    weak var view: NewsView? { get set }
    var interactor: NewsUseCase! { get set }
    var router: NewsWireframe! { get set }
    
    func viewDidLoad()
    func didSelectNews(_ news: News)
}

protocol NewsUseCase: class {
    weak var output: NewsInteractorOutput! { get set }
    
    func fetchNews()
}

protocol NewsInteractorOutput: class {
    func newsFetched(_ news: [News])
    func newsFetchFailed()
}

protocol NewsWireframe: class {
    weak var viewController: UIViewController? { get set }
    
//    func presentDetails(forNews news: News)
    
    static func assembleModule() -> UIViewController
}

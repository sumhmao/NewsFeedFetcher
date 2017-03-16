//
//  NewsRouter.swift
//  NewsFeedFetcher
//
//  Created by Chavalit Vanasapdamrong on 3/17/2560 BE.
//  Copyright © 2560 Chavalit Vanasapdamrong. All rights reserved.
//

import UIKit

class NewsRouter: NewsWireframe {
    
    weak var viewController: UIViewController?
    
    static func assembleModule() -> UIViewController {
        let view = R.storyboard.newsStoryboard.newsViewController()
        let presenter = NewsPresenter()
        let interactor = NewsInteractor()
        let router = NewsRouter()
        
        let navigation = UINavigationController(rootViewController: view!)
        
        view?.presenter = presenter
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        
        interactor.output = presenter
        
        router.viewController = view
        
        return navigation
    }
    
}

//
//  NewsViewController.swift
//  NewsFeedFetcher
//
//  Created by Chavalit Vanasapdamrong on 3/17/2560 BE.
//  Copyright © 2560 Chavalit Vanasapdamrong. All rights reserved.
//

import UIKit

class NewsViewController: UIViewController {
    
    var presenter: NewsPresentation!

    override func viewDidLoad() {
        super.viewDidLoad()
        showLoadingIndicator()
        presenter.viewDidLoad()
    }

}

extension NewsViewController: NewsView {
    
    func showNoContentScreen() {
        hideLoadingIndicator()
    }
    
    func showArticlesData(_ articles: [Article]) {
        hideLoadingIndicator()
    }
}

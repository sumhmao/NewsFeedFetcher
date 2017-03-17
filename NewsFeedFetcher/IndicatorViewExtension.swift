//
//  IndicatorViewExtension.swift
//  NewsFeedFetcher
//
//  Created by Chavalit Vanasapdamrong on 3/17/2560 BE.
//  Copyright © 2560 Chavalit Vanasapdamrong. All rights reserved.
//

import Foundation
import SwiftSpinner

extension IndicatableView where Self: UIViewController {
    
    func showLoadingIndicator() {
        SwiftSpinner.show(Localization.Articles.loadingMessage)
    }
    
    func hideLoadingIndicator() {
        SwiftSpinner.hide()
    }
    
    func showErrorMessage(_ message: String) {
        SwiftSpinner.show(message, animated: false).addTapHandler({
            SwiftSpinner.hide()
        })
    }
    
}

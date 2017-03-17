//
//  ViewProtocols.swift
//  NewsFeedFetcher
//
//  Created by Chavalit Vanasapdamrong on 3/17/2560 BE.
//  Copyright © 2560 Chavalit Vanasapdamrong. All rights reserved.
//

import Foundation

protocol ReusableView: class {}

protocol NibLoadableView: class {}

protocol IndicatableView: class {
    func showLoadingIndicator()
    func hideLoadingIndicator()
}

protocol ClearNavigationBarView: class {
    func setClearNavigationBarStyle()
}

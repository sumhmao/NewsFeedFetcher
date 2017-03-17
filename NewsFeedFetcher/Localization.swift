//
//  Localization.swift
//  NewsFeedFetcher
//
//  Created by Chavalit Vanasapdamrong on 3/17/2560 BE.
//  Copyright © 2560 Chavalit Vanasapdamrong. All rights reserved.
//

import Foundation

enum Localization {
    
    enum Articles {
        static let navigationBarTitle = "FEED_NAVIGATION_BAR_TITLE".localized()
        static let sortButtonTitle = "BUTTON_SORT_TITLE".localized()
    }
    
    enum ArticlesSort {
        static let alertSortByTitle = "ALERT_SORT_BY_TITLE".localized()
        static let dateOption = "ALERT_DATE_OPTION".localized()
        static let titleOption = "ALERT_TITLE_OPTION".localized()
        static let authorOption = "ALERT_AUTHOR_OPTION".localized()
        static let cancelOption = "ALERT_CANCEL_OPTION".localized()
    }
}

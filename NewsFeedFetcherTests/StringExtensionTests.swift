//
//  StringExtensionTests.swift
//  NewsFeedFetcher
//
//  Created by Chavalit Vanasapdamrong on 3/18/2560 BE.
//  Copyright © 2560 Chavalit Vanasapdamrong. All rights reserved.
//

import XCTest
@testable import NewsFeedFetcher

class StringExtensionTests: XCTestCase {
    
    func testLocalized() {
        let string = "FEED_NAVIGATION_BAR_TITLE"
        let randomString = "AKJLSjjSKLJklALKJKL"
        XCTAssertEqual(string.localized(), NSLocalizedString(string, comment: ""))
        XCTAssertEqual(randomString.localized(), NSLocalizedString(randomString, comment: ""))
        XCTAssertEqual(randomString.localized(), randomString)
    }
    
}

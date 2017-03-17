//
//  EndpointTests.swift
//  NewsFeedFetcher
//
//  Created by Chavalit Vanasapdamrong on 3/17/2560 BE.
//  Copyright © 2560 Chavalit Vanasapdamrong. All rights reserved.
//

import XCTest
@testable import RxSwift
@testable import NewsFeedFetcher

class EndpointTests: XCTestCase {
    
    func testFetchArticlesEndpoint() {
        let disposeBag = DisposeBag()
        ArticlesApiService.fetchArticles(from: .TechCrunch)
            .subscribe(
                onNext: nil,
                onError: { error in
                    XCTFail(error.localizedDescription)
            }
            ).addDisposableTo(disposeBag)
    }
    
}

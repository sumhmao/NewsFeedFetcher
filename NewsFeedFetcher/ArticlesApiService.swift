//
//  ArticlesApiService.swift
//  NewsFeedFetcher
//
//  Created by Chavalit Vanasapdamrong on 3/17/2560 BE.
//  Copyright © 2560 Chavalit Vanasapdamrong. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper
import RxSwift

class ArticlesApiService {
    
    static func fetchArticles(from source: NewsSource) -> Observable<[Article]> {
        return Observable<[Article]>.create { observer -> Disposable in
            let request = Alamofire
                .request(Endpoints.Articles.fetch(source).url, method: .get)
                .validate()
                .responseArray(keyPath: Endpoints.Articles.fetch(source).path,
                               completionHandler: { (response: DataResponse<[Article]>) in
                                switch response.result {
                                case .success(let articles):
                                    observer.onNext(articles)
                                    observer.onCompleted()
                                    
                                case .failure(let error):
                                    observer.onError(error)
                                }
                })
            
            return Disposables.create(with: {
                request.cancel()
            })
        }
    }
    
}

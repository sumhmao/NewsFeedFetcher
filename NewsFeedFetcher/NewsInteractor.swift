//
//  NewsInteractor.swift
//  NewsFeedFetcher
//
//  Created by Chavalit Vanasapdamrong on 3/17/2560 BE.
//  Copyright © 2560 Chavalit Vanasapdamrong. All rights reserved.
//

import UIKit
import Alamofire
import ObjectMapper
import AlamofireObjectMapper
import RxSwift

class NewsInteractor: NewsUseCase {
 
    weak var output: NewsInteractorOutput!
    private var disposeBag = DisposeBag()
    
    func fetchNews() {
        
    }
    
}

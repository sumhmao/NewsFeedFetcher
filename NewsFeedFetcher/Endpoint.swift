//
//  Endpoint.swift
//  NewsFeedFetcher
//
//  Created by Chavalit Vanasapdamrong on 3/17/2560 BE.
//  Copyright © 2560 Chavalit Vanasapdamrong. All rights reserved.
//

import Foundation

struct API {
    static let baseUrl = "https://newsapi.org/v1/"
    static let apiKey = "55d6c39262c243b087de6758e34132ad"
}

protocol Endpoint {
    var path: String { get }
    var url: String { get }
}

enum Endpoints {
    
    enum Articles: Endpoint {
        case fetch(NewsSource)
        
        public var path: String {
            switch self {
            case .fetch:
                return "articles"
            }
        }
        
        public var url: String {
            switch self {
            case .fetch(let source):
                return "\(API.baseUrl)\(path)?source=\(source.rawValue)&apiKey=\(API.apiKey)"
            }
        }
        
    }
}


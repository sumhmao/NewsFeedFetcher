//
//  News.swift
//  NewsFeedFetcher
//
//  Created by Chavalit Vanasapdamrong on 3/16/2560 BE.
//  Copyright © 2560 Chavalit Vanasapdamrong. All rights reserved.
//

import UIKit
import ObjectMapper

struct News {
    var author = ""
    var title = ""
    var description = ""
    var url = ""
    var urlToImage = ""
    var publishedAt = ""
}

extension News: Mappable {
    
    init?(map: Map) {}
    
    mutating func mapping(map: Map) {
        author <- map["author"]
        title <- map["title"]
        description <- map["description"]
        url <- map["url"]
        urlToImage <- map["urlToImage"]
        publishedAt <- map["publishedAt"]
    }
}

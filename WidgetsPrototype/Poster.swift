//
//  Poster.swift
//  WidgetsPrototype
//
//  Created by solal on 3/07/2015.
//  Copyright (c) 2015 solal. All rights reserved.
//

import ObjectMapper

class Poster: Mappable {
    var source: Source?
    var name: String?
    var avatar: String?
    
    required init?(_ map: Map) {}
  
    func mapping(map: Map) {
        source <- map["source"]
        name   <- map["name"]
        avatar <- map["avatar"]
    }
}

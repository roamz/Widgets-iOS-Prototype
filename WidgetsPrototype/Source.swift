//
//  Source.swift
//  WidgetsPrototype
//
//  Created by solal on 3/07/2015.
//  Copyright (c) 2015 solal. All rights reserved.
//

import ObjectMapper

class Source: Mappable {
    var link: String?
    var network: String?
    var id: String?
  
    required init?(_ map: Map) {}
  
    func mapping(map: Map) {
        link    <- map["link"]
        network <- map["network"]
        id      <- map["id"]
    }
}

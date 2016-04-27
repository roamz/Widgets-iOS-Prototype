//
//  ImageSize.swift
//  WidgetsPrototype
//
//  Created by solal on 3/07/2015.
//  Copyright (c) 2015 solal. All rights reserved.
//

import ObjectMapper

class ImageSize: Mappable {
    var width: Int?
    var height: Int?
    
    required init?(_ map: Map) {}
    
    func mapping(map: Map) {
        width  <- map["width"]
        height <- map["height"]
    }
}

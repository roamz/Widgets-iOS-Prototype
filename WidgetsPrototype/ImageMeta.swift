//
//  ImageMeta.swift
//  WidgetsPrototype
//
//  Created by solal on 3/07/2015.
//  Copyright (c) 2015 solal. All rights reserved.
//

import ObjectMapper

class ImageMeta: Mappable {
    var url: String?
    var width: Int?
    var height: Int?
  
    class func newInstance() -> Mappable {
        return ImageMeta()
    }
    
    func mapping(map: Map) {
        url    <- map["url"]
        width  <- map["width"]
        height <- map["height"]
    }
  
}

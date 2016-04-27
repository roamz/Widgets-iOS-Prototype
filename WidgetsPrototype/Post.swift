//
//  Post.swift
//  WidgetsPrototype
//
//  Created by solal on 3/07/2015.
//  Copyright (c) 2015 solal. All rights reserved.
//

import ObjectMapper

class Post: Mappable {
    var rating: Int?
    var text: String?
    var image: String?
    var video: String?
    var imageSize: ImageSize?
    var images: [ImageMeta]?
    var kind: String?
    var created: String?
    var source: Source?
    var poster: Poster?
    var link: String?
  
    required init?(_ map: Map) {}
  
    func mapping(map: Map) {
        rating    <- map["rating"]
        text      <- map["text"]
        image     <- map["image"]
        video     <- map["video"]
        imageSize <- map["image_size"]
        images    <- map["images"]
        kind      <- map["kind"]
        created   <- map["created"]
        source    <- map["source"]
        poster    <- map["poster"]
        link      <- map["link"]
    }
}

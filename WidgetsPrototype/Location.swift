//
//  Location.swift
//  WidgetsPrototype
//
//  Created by solal on 3/07/2015.
//  Copyright (c) 2015 solal. All rights reserved.
//

import ObjectMapper

class Location: Mappable {
  var latitude: Float?
  var longitude: Float?
  var address: String?
  var name: String?
  
  required init?(_ map: Map) {
    mapping(map)
  }
  
  func mapping(map: Map) {
    latitude  <- map["latitude"]
    longitude <- map["longitude"]
    address   <- map["address"]
    name      <- map["name"]
  }
  
}

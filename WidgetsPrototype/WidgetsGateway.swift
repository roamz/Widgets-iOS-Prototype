//
//  WidgetsGateway.swift
//  WidgetsPrototype
//
//  Created by solal on 3/07/2015.
//  Copyright (c) 2015 solal. All rights reserved.
//

import Alamofire
import ObjectMapper

struct WidgetsGateway {
    
  var userHash: String?
    
  init(userHash: String) {
    self.userHash = userHash
  }
  
  func fetch(completion: (widgets: [Widget]) -> Void) {
    let url = "https://cdn.getlocalmeasure.com/public/\(self.userHash!)/widgets.json"
    Alamofire.request(.GET, url).responseJSON { (_, _, JSON, _) in
        if (JSON != nil) {
            completion( widgets: self.parseJSON(JSON!) )
        } else {
            completion( widgets: [Widget]() )
        }
    }
  }
  
  private func parseJSON(JSON: AnyObject) -> [Widget] {
    var widgets = [Widget]()
    for item in JSON as! [AnyObject] {
      let widget = Mapper<Widget>().map(item)
      widgets.append(widget!)
    }
    
    return widgets
  }
  
}
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
  
  func fetch(completion: (widgets: [Widget]) -> Void) {
    let url = "https://cdn.getlocalmeasure.com/public/51133f30f9bfa548c7c6540f/widgets.json"
    Alamofire.request(.GET, url).responseJSON { (_, _, JSON, _) in
      completion( widgets: self.parseWidgets(JSON!) )
    }
  }
  
  func parseWidgets(JSON: AnyObject) -> [Widget] {
    var widgets = [Widget]()
    for item in JSON as! [AnyObject] {
      let widget = Mapper<Widget>().map(item)
      widgets.append(widget!)
    }
    
    println(widgets.count)
    return widgets
  }
  
}
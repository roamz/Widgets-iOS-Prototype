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
        let env = EnvManager.sharedInstance
        let url = "\(env.env!)/\(env.userHash!)/widgets.json"
        
        Alamofire.request(.GET, url).responseJSON { response in
            if let JSON = response.result.value {
                completion( widgets: self.parseJSON(JSON) )
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

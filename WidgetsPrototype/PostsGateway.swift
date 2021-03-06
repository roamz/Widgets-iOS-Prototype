//
//  PostsGateway.swift
//  WidgetsPrototype
//
//  Created by solal on 3/07/2015.
//  Copyright (c) 2015 solal. All rights reserved.
//

import Alamofire
import ObjectMapper

struct PostsGateway {
    
  var widgetHash: String?
    
  init(widgetHash: String) {
    self.widgetHash = widgetHash
  }
  
  func fetch(completion: (posts: [Post]) -> Void) {
    let env = EnvManager.sharedInstance
    let url = "\(env.env!)/\(self.widgetHash!)/frozen.json"
    
    Alamofire.request(.GET, url).responseJSON { response in
        if let JSON = response.result.value {
            let postList: AnyObject? = JSON["posts"]!
            completion( posts: self.parseJSON(postList!) )
        } else {
            completion( posts: [Post]() )
        }
    }
  }
  
  private func parseJSON(JSON: AnyObject) -> [Post] {
    var posts = [Post]()
    for item in JSON as! [AnyObject] {
      let post = Mapper<Post>().map(item)
      posts.append(post!)
    }
    
    return posts
  }
  
}
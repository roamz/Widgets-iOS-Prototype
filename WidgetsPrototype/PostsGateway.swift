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
  
  func fetch(hash: String, completion: (posts: [Post]) -> Void) {
    let url = "https://cdn.getlocalmeasure.com/public/\(hash)/frozen.json"
    
    Alamofire.request(.GET, url).responseJSON { (_, _, JSON, _) in
      let postList: AnyObject? = JSON!["posts"]!
      completion( posts: self.parsePosts(postList!) )
    }
  }
  
  func parsePosts(JSON: AnyObject) -> [Post] {
    var posts = [Post]()
    for item in JSON as! [AnyObject] {
      let post = Mapper<Post>().map(item)
      posts.append(post!)
    }
    
    return posts
  }
  
}
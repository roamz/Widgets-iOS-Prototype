//
//  WidgetsTableViewController.swift
//  WidgetsPrototype
//
//  Created by solal on 3/07/2015.
//  Copyright (c) 2015 solal. All rights reserved.
//

import UIKit

class WidgetsTableViewController: UITableViewController {
  
  var postsList = [Post]()

  override func viewDidLoad() {
    super.viewDidLoad()
    self.tableView.rowHeight = 450.0
    self.tableView.separatorStyle = .None
    
    var posts = [Post]()
    PostsGateway().fetch { (posts) -> Void in
      self.postsList = posts
      self.tableView.reloadData()
    }
  }

  override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return 1
  }

  override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.postsList.count
  }

  override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell: PostTableViewCell = tableView.dequeueReusableCellWithIdentifier("postCell", forIndexPath: indexPath) as! PostTableViewCell
    let item = self.postsList[indexPath.row]

    cell.postText.text = item.text!
    cell.loadPostImage(item.image!)
    
    cell.posterName.text = item.poster!.name
    cell.loadPosterAvatar(item.poster!.avatar!)
    
    return cell
  }

}

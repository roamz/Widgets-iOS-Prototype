//
//  WidgetsTableViewController.swift
//  WidgetsPrototype
//
//  Created by solal on 3/07/2015.
//  Copyright (c) 2015 solal. All rights reserved.
//

import UIKit

class WidgetsTableViewController: UITableViewController {
  
  var widgetsList = [Widget]()

  override func viewDidLoad() {
    super.viewDidLoad()
    self.title = "Widgets"
    
    WidgetsGateway().fetch { (widgets) -> Void in
      self.widgetsList = widgets
      self.tableView.reloadData()
    }
  }

  override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return 1
  }

  override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.widgetsList.count
  }

  override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell: UITableViewCell = tableView.dequeueReusableCellWithIdentifier("widgetCell", forIndexPath: indexPath) 
    cell.textLabel?.text = self.widgetsList[indexPath.row].title
    return cell
  }
  
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    if segue.identifier == "widgetPosts" {
      if let destinationVC = segue.destinationViewController as? PostsTableViewController {
        let selectedIndex = self.tableView.indexPathForCell(sender as! UITableViewCell)
        destinationVC.widget = self.widgetsList[selectedIndex!.row]
      }
    }
  }

}

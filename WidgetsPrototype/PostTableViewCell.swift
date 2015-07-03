//
//  PostTableViewCell.swift
//  WidgetsPrototype
//
//  Created by solal on 3/07/2015.
//  Copyright (c) 2015 solal. All rights reserved.
//

import UIKit
import SDWebImage

class PostTableViewCell: UITableViewCell {
  
  @IBOutlet weak var postImage: UIImageView!
  @IBOutlet weak var postText: UILabel!
  
  @IBOutlet weak var posterName: UILabel!
  @IBOutlet weak var posterAvatar: UIImageView!
  
  override func awakeFromNib() {
    super.awakeFromNib()
  }
  
  func loadPostImage(imageURL: String) {
    self.imageLoader(imageURL, imageView: self.postImage)
  }
  
  func loadPosterAvatar(imageURL: String) {
    self.imageLoader(imageURL, imageView: self.posterAvatar)
    self.posterAvatar.layer.cornerRadius = self.posterAvatar.frame.size.width / 2
    self.posterAvatar.clipsToBounds = true
  }
  
  func imageLoader(url: String, imageView: UIImageView) {
    imageView.sd_setImageWithURL(NSURL(string: url), completed: {(image: UIImage!, error: NSError!, cacheType: SDImageCacheType, url: NSURL!) -> Void in
      println("Loaded: \(url)")
    })
  }

}

//
//  FeedTblCell.swift
//  Practicle
//
//  Created by Devang Lakhani  on 3/10/22.
//  Copyright © 2022 Devang Lakhani. All rights reserved.
//

import UIKit
import SDWebImage

class FeedTblCell: UITableViewCell {
    @IBOutlet weak var imgUser: UIImageView!
    @IBOutlet weak var lblUserName : UILabel!
    @IBOutlet weak var lblActiveTime : UILabel!
    @IBOutlet weak var btnMore : UIButton!
    @IBOutlet weak var lblDescription : UILabel!
    @IBOutlet weak var imgPost : UIImageView!
    @IBOutlet weak var lblLike : UILabel!
    @IBOutlet weak var lblMessageCount: UILabel!
    @IBOutlet weak var btnLike : UILabel!
    @IBOutlet weak var btnMessage : UILabel!
    
    
    func configFeedCell(data: Feeds){
        lblLike.text  = data.likeCount
        lblMessageCount.text = data.commentCount
        lblDescription.text = data.content
        lblUserName.text = data.fullName
        //Url is not Working So Set default User Image as Placeholder
        imgUser.sd_imageIndicator = SDWebImageActivityIndicator.gray
        imgUser.sd_setImage(with: data.userProfileUrl, placeholderImage: UIImage(named: "user1"), options: .allowInvalidSSLCertificates, context: nil)
        imgUser.layer.cornerRadius = 5
        imgPost.layer.cornerRadius = 5
        if let attachment = data.arrAttachments.first{
            //attachment Image url also not working so Set default banner2 as Placeholder
            imgPost.sd_imageIndicator = SDWebImageActivityIndicator.gray
            imgPost.sd_setImage(with: attachment.mainImgUrl, placeholderImage: UIImage(named: "banner2"), options: .allowInvalidSSLCertificates, context: nil)
        }
    }
}

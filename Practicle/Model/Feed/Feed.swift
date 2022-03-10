//
//  Feed.swift
//  Practicle
//
//  Created by Devang Lakhani  on 3/11/22.
//  Copyright © 2022 Devang Lakhani. All rights reserved.
//

import Foundation

class Feeds{
    let id : String
    let userId : String
    var content: String
    var likeCount : String
    var commentCount : String
    var status : String
    var fullName : String
    var userAvtar : String
    var userLike : String
    var arrAttachments: [Attachments] = []
    
    var userProfileUrl : URL?{
        return URL(string: userAvtar)
    }
    
    init(dict: NSDictionary) {
        id = dict.getStringValue(key: "feedID")
        userId = dict.getStringValue(key: "userID")
        content = dict.getStringValue(key: "content")
        likeCount = dict.getStringValue(key: "likeCount")
        commentCount = dict.getStringValue(key: "commentCount")
        status = dict.getStringValue(key: "status")
        fullName = dict.getStringValue(key: "fullName")
        userLike = dict.getStringValue(key: "userLike")
        userAvtar = dict.getStringValue(key: "userAvatar")
        if let dictImgs = dict["attachment"] as? [NSDictionary]{
            for attachments in dictImgs{
                let objAttach = Attachments(dict: attachments)
                self.arrAttachments.append(objAttach)
            }
        }
    }
}

class Attachments{
    var id : String
    var urlStr : String
    var thumUrl : String
    var type : String
    
    var mainImgUrl : URL?{
        return URL(string: urlStr)
    }
    
    var thumbnailUrl : URL?{
        return URL(string: thumUrl)
    }
    
    init(dict: NSDictionary) {
        id = dict.getStringValue(key: "feedAttachmentID")
        urlStr = dict.getStringValue(key: "url")
        thumUrl = dict.getStringValue(key: "thumbURL")
        type = dict.getStringValue(key: "attachmentType")
    }
}

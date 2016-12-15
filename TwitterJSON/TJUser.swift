//
//  TJUser.swift
//  TwitterJSON
//
//  Created by Kyle Goslan on 04/08/2015.
//  Copyright (c) 2015 Kyle Goslan. All rights reserved.
//

import Foundation
import SwiftyJSON

/**
A single user object.

Contains information related to a single user.
*/
open class TJUser {
    
    /**
    The full name of the user
    */
    open var name: String!
    
    /**
    The screen name of the user
    */
    open var screenName: String!
    
    /**
    User bio/description
    */
    open var description: String!
    
    /**
    How many followers the user has
    */
    open var followersCount: Int!
    
    /**
    Use this to check if a user has a profile image. Defaults to false
    */
    open var hasProfileImage = false
    
    /**
    If the user has a profile image this will hold the url to the image
    */
    open var profileImageURL: String!
    
    /**
    If the user has a profile image this will load the image into a UIImage
    */
    open var profileImage: UIImage!
    
    /**
    Profile banner image Url
    */
    open var profileBannerURL: String!
    
    /**
    How many people the user is followiung
    */
    open var followingCount: Int!
    
    /**
    Total number of tweets by the user
    */
    open var totalTweets: Int!
    
    
    /**
    Initilize with a json object.

    The init method parses the json and sets the objets properties.
    */
    init(userInfo: JSON) {
        
        if let user = userInfo["name"].string {
            self.name = user
        } else {
            self.name = nil
        }
        
        if let screenName = userInfo["screen_name"].string {
            self.screenName = screenName
        }
        
        if let description = userInfo["description"].string {
            self.description = description
        }
        
        if let followersCount = userInfo["followers_count"].int {
            self.followersCount = followersCount
        }
    
        if let profileImageURL = userInfo["profile_image_url"].string {
            self.profileImageURL = profileImageURL
        }
        
        if let profileBannerURL = userInfo["profile_banner_url"].string {
            self.profileBannerURL = profileBannerURL
        }
        
        if let followingCount = userInfo["frinds_count"].int {
            self.followingCount = followingCount
        }
        
        if let totalTweets = userInfo["statuses_count"].int {
            self.totalTweets = totalTweets
        }
        
    }

}







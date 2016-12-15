//
//  TwitterJSONUsers.swift
//  TwitterJSON
//
//  Created by Kyle Goslan on 14/08/2015.
//  Copyright (c) 2015 Kyle Goslan. All rights reserved.
//

import Foundation

/**
Methods that deal with post requests are in this file.
*/
public extension TwitterJSON {
    
    /**
    Retweet a tweet.
    
    :param: Int The ID of the tweet to retweet.
    :param: Completion Contains a sussess bool. Success will be true if the user has already retweeted the tweet.
    */
    public class func retweet(_ tweetID: Int, completion: @escaping (_ success: Bool) -> Void) {
        let apiURL = "https://api.twitter.com/1.1/statuses/retweet/\(tweetID).json"
        TwitterJSON.makeRequest(.POST, parameters: nil, apiURL: apiURL) { success, _ in
            DispatchQueue.main.async(execute: {
                completion(success)
            })
        }
    }
    
    /**
    Retweet a tweet.
    
    :param: Int The ID of the tweet to retweet.
    :param: Completion Contains a sussess bool. Success will be true if the user has already retweeted the tweet.
    */
    public class func favoriteTweet(_ tweetID: Int, completion: @escaping (_ success: Bool) -> Void) {
        let apiURL = "https://api.twitter.com/1.1/favorites/create.json?id=\(tweetID)"
        TwitterJSON.makeRequest(.POST, parameters: nil, apiURL: apiURL) { success, _ in
            DispatchQueue.main.async(execute: {
                completion(success)
            })
        }
    }
    
    /**
    Create a new tweet.
    
    :param: String Text to post.
    :param: Completion Contains a sussess bool.
    */
    public class func postTweet(_ text: String, completion: @escaping (_ success: Bool) -> Void) {
        let apiURL = "https://api.twitter.com/1.1/statuses/update.json"
        let parameters = [
            "status" : text.replacingPercentEscapes(using: String.Encoding.utf8)!
        ]
        TwitterJSON.makeRequest(.POST, parameters: parameters, apiURL: apiURL) { success, _ in
            DispatchQueue.main.async(execute: {
                completion(success)
            })
        }
    }
    
    
    
}

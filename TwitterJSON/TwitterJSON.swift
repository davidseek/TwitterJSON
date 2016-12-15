//
//  TwitterJSON.swift
//  TwitterJSON
//
//  Created by Kyle Goslan on 04/08/2015.
//  Copyright (c) 2015 Kyle Goslan. All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire
import Accounts
import Social

/**
All the real network requests are sent through this object.
*/
open class TwitterJSON {
    
    /**
    Nuber of results to return.
    */
    open static var numberOfResults = 20
    
    /**
    Needed to feedback alerts to the user.
    */
    open static var viewController: UIViewController?

    /**
    Deals with the final request to the API.
    
    :param: SLRequestMethod Will always be either .GET or .POST.
    :param: Dictionary Parameters for the query. 
    :param: Dictionary Parameters for the query.
    :param: String The API url destination.
    :param: Completion Handler for the request containing an error and or JSON.
    */
    open class func makeRequest(_ requestMethod: SLRequestMethod, parameters: [String : String]!, apiURL: String, completion: @escaping ((_ success: Bool, _ json: JSON) -> Void)) {
        TwitterJSON.getAccount {(account: ACAccount?) -> Void in
            if let _ = account {
                let postRequest = SLRequest(forServiceType: SLServiceTypeTwitter, requestMethod: requestMethod, url: URL(string: apiURL), parameters: parameters)
                postRequest?.account = account
                postRequest?.perform(handler: { (data, urlResponse, error) -> Void in
                    if error == nil {
                        let json = JSON(data: data!)
                        completion(true, json)
                    } else {
                        completion(false, nil)
                    }
                })
            } else {
                completion(false, nil)
            }
        }
    }
    
    /**
    Get the Twitter account configured in settings.
    
    :param: completion A closure which contains the first account.
    */
    fileprivate class func getAccount(_ completionHandler: @escaping (_ account: ACAccount?) -> Void) {
        let accountStore = ACAccountStore()
        let accountType = accountStore.accountType(withAccountTypeIdentifier: ACAccountTypeIdentifierTwitter)
        
        accountStore.requestAccessToAccounts(with: accountType, options: nil) { (granted, error) -> Void in
            if granted {
                let accounts: [ACAccount] = accountStore.accounts(with: accountType) as! [ACAccount]
                if accounts.count == 1 {
                    completionHandler(accounts.first!)
                } else {
                    let alertController = UIAlertController(title: "Select an account", message: nil, preferredStyle: .alert)
                    for account in accounts {
                        let alertAction = UIAlertAction(title: account.username, style: .default) { (alertAction: UIAlertAction!) -> Void in
                            completionHandler(account)
                        }
                        alertController.addAction(alertAction)
                    }
                    TwitterJSON.viewController?.present(alertController, animated: true, completion: nil)
                }
            } else {
                let title = "Grant Access To Twitter"
                let message = "You need to give permission for this application to use your Twitter account. Manage in Settings."
                let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
                let action = UIAlertAction(title: "Okay", style: .default, handler: nil)
                alertController.addAction(action)
                TwitterJSON.viewController?.present(alertController, animated: true, completion: nil)
            }
        }
    }
    
    /**
    Loads profile images of users.
    
    :param: Optional Array of TJTweet objects.
    :param: Optional Array of TJUser objects.
    :param: Completion Returns the arry of objects passed in with the images loaded.
    */
    internal class func loadImages(_ tweets: [TJTweet]?, users: [TJUser]?, completion: @escaping (_ tweets: [TJTweet]?, _ users: [TJUser]?) -> Void) {
//        var i = 0
        
        if let tweets = tweets {
            for tweet in tweets {
                Alamofire.request(tweet.user.profileImageURL).responseJSON { response in
                    
//                    tweet.user.profileImage = UIImage(data: data!, scale:1)
//                    i++
//                    if i == tweets.count {
//
//                    }
                    completion(nil, nil)
                }
            }
        }
        
        if let users = users {
            for user in users {
                Alamofire.request(user.profileImageURL).responseJSON { response in
//                    user.profileImage = UIImage(data: data!, scale:1)
//                    i++
//                    if i == users.count {
//                        
//                    }
                    
                    completion(nil, nil)
                }
            }
        }
    }
    
}

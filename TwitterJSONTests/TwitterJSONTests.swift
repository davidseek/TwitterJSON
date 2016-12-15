//
//  TwitterJSONTests.swift
//  TwitterJSONTests
//
//  Created by Kyle Goslan on 04/08/2015.
//  Copyright (c) 2015 Kyle Goslan. All rights reserved.
//

import UIKit
import XCTest
import SwiftyJSON


class TwitterJSONTests: XCTestCase {
    
    override func setUp() {
        TwitterJSON.numberOfResults = 10
    }
    
    func testGetHomeFeed() {
        let expectation = self.expectation(description: "Test Get Home Feed")
        
        TwitterJSON.getHomeFeed { (tweets) -> Void in
            XCTAssertEqual(tweets.count, TwitterJSON.numberOfResults)
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 5, handler: { error in
            XCTAssertNil(error, "Error")
        })
    }
    
    func testRetweet() {
        let expectation = self.expectation(description: "Test Retweet")
        
        TwitterJSON.retweet(632158353607802880, completion: { (success) -> Void in
            XCTAssertTrue(success)
            expectation.fulfill()
        })
        
        waitForExpectations(timeout: 5, handler: { error in
            XCTAssertNil(error, "Error")
        })
    }
    
    func testFavorite() {
        let expectation = self.expectation(description: "Test Favorite")
        
        TwitterJSON.favoriteTweet(632158353607802880, completion: { (success) -> Void in
            XCTAssertTrue(success)
            expectation.fulfill()
        })
        
        waitForExpectations(timeout: 5, handler: { error in
            XCTAssertNil(error, "Error")
        })
    }
    
    func testPostTweet() {
        let expectation = self.expectation(description: "Test Post Tweet")
        
        TwitterJSON.postTweet("Posted from running test in my project...", completion: { (success) -> Void in
            XCTAssertTrue(success)
            expectation.fulfill()
        })
        
        waitForExpectations(timeout: 5, handler: { error in
            XCTAssertNil(error, "Error")
        })
    }
    
    func testSearchForTweets() {
        let expectation = self.expectation(description: "Test Search Tweets")
        
        TwitterJSON.searchForTweets("Apple") { (tweets) -> Void in
            XCTAssertEqual(tweets.count, TwitterJSON.numberOfResults)
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 5, handler: { error in
            XCTAssertNil(error, "Error")
        })
    }
    
    func testGetUserFollowers() {
        let expectation = self.expectation(description: "Test User Followers")
        
        TwitterJSON.getFollowersForUser("KyleGoslan", completion: { (users) -> Void in
            XCTAssertEqual(users.count, TwitterJSON.numberOfResults)
            expectation.fulfill()
        })
        
        waitForExpectations(timeout: 5, handler: { error in
            XCTAssertNil(error, "Error")
        })
    }
    
    func testGetFollowing() {
        let expectation = self.expectation(description: "Get Following")
        
        TwitterJSON.getFollowingForUser("KyleGoslan", completion: { (users) -> Void in
            XCTAssertEqual(users.count, TwitterJSON.numberOfResults)
            expectation.fulfill()
        })
        
        waitForExpectations(timeout: 5, handler: { error in
            XCTAssertNil(error, "Error")
        })
    }
    
    

}

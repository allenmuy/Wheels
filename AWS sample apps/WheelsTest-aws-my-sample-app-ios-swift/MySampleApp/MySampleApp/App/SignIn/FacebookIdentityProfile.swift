//
//  AWSFacebookIdentityProfile.swift
//  MySampleApp
//
//
// Copyright 2017 Amazon.com, Inc. or its affiliates (Amazon). All Rights Reserved.
//
// Code generated by AWS Mobile Hub. Amazon gives unlimited permission to 
// copy, distribute and modify it.
//
// Source code generated from template: aws-my-sample-app-ios-swift v0.18
//
//

import AWSMobileHubHelper
import FBSDKCoreKit
import FBSDKLoginKit

class FacebookIdentityProfile : AWSIdentityProfile {

    /**
     The URL for profile image of a user.
     */
    public var imageURL: URL?
    /**
     The User Name of a user.
     */
    public var userName: String?
    fileprivate var facebookProfileAttributes : [String : Any]
    
    init() {
        facebookProfileAttributes = [String: Any]()
    }
    
    static let _sharedInstance = FacebookIdentityProfile()
    /*
     The shared instance for the profile provider.
     */
    static func sharedInstance() -> AWSIdentityProfile {
        return _sharedInstance
    }
    
    /**
     Fetches custom stored profile attribute using specified key.
     */
    func getAttributeForKey(_ key: String) -> Any? {
        return facebookProfileAttributes[key]
    }
    
    
    /**
     Stores custom values using specified key.
     */
    func setProfileAttribute(_ value: Any, forKey key: String) {
        facebookProfileAttributes[key] = value
    }
    
    
    /**
     Fetches the entire identity profile attributes map.
     */
    func getAttributesMap() -> [String : Any] {
        return facebookProfileAttributes
    }
    
    
    /**
     Clears the current profile information.
     */
    func clear() {
        facebookProfileAttributes = [String: Any]()
    }
    
    
    /**
     Loads the profile information for current signed-in user.
     */
    func load() {
        let imageGraphRequest = FBSDKGraphRequest(graphPath: "me", parameters: ["fields": "picture.type(large)"])
        let imageConnection = FBSDKGraphRequestConnection()
        imageConnection.add(imageGraphRequest, completionHandler: { (connection, result, error) in
            guard let imageResult = result as? NSDictionary else  { return}
            if let imageURL = URL(string:(((imageResult.value(forKey: "picture") as AnyObject).value(forKey: "data") as AnyObject).value(forKey: "url") as? String)!) {
                self.imageURL = imageURL
            }
        })
        imageConnection.start()
        
        let userGraphRequest = FBSDKGraphRequest(graphPath: "me", parameters: ["fields": "id, name, email"])
        let userConnection = FBSDKGraphRequestConnection()
        userConnection.add(userGraphRequest, completionHandler: { (connection, result, error) in
            guard let userResult = result as? NSDictionary else { return }
                if let userName = userResult.value(forKey: "name")  as? String {
                    self.userName = userName
                }
        })
        userConnection.start()
    }
    // Set any additional proflie attributes here. This method is called after a user signs in with a provider.
}
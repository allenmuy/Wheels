//
//  User.swift
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

import Foundation
import UIKit
import AWSDynamoDB

class User: AWSDynamoDBObjectModel, AWSDynamoDBModeling {
    
    var _userId: String?
    var _bio: String?
    var _birthdate: String?
    var _credits: NSNumber?
    var _driversLicenseId: String?
    var _email: String?
    var _firstName: String?
    var _lastName: String?
    var _password: String?
    var _phoneNumber: String?
    var _punctuality: NSNumber?
    var _ratingAttire: NSNumber?
    var _ratingNumber: NSNumber?
    var _ratingPersonality: NSNumber?
    var _ratingSpeed: NSNumber?
    var _responseTime: NSNumber?
    var _userImageDir: String?
    
    class func dynamoDBTableName() -> String {

        return "wheelstest-mobilehub-1505962214-user"
    }
    
    class func hashKeyAttribute() -> String {

        return "_userId"
    }
    
    override class func jsonKeyPathsByPropertyKey() -> [AnyHashable: Any] {
        return [
               "_userId" : "userId",
               "_bio" : "bio",
               "_birthdate" : "birthdate",
               "_credits" : "credits",
               "_driversLicenseId" : "drivers_license_id",
               "_email" : "email",
               "_firstName" : "first_name",
               "_lastName" : "last_name",
               "_password" : "password",
               "_phoneNumber" : "phone_number",
               "_punctuality" : "punctuality",
               "_ratingAttire" : "rating_attire",
               "_ratingNumber" : "rating_number",
               "_ratingPersonality" : "rating_personality",
               "_ratingSpeed" : "rating_speed",
               "_responseTime" : "response_time",
               "_userImageDir" : "user_image_dir",
        ]
    }
}

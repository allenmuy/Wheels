//
//  Locations.swift
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

class Locations: AWSDynamoDBObjectModel, AWSDynamoDBModeling {
    
    var _userId: String?
    var _itemId: String?
    var _category: String?
    var _latitude: NSNumber?
    var _longitude: NSNumber?
    var _name: String?
    
    class func dynamoDBTableName() -> String {

        return "wheelstest-mobilehub-1505962214-Locations"
    }
    
    class func hashKeyAttribute() -> String {

        return "_userId"
    }
    
    class func rangeKeyAttribute() -> String {

        return "_itemId"
    }
    
    override class func jsonKeyPathsByPropertyKey() -> [AnyHashable: Any] {
        return [
               "_userId" : "userId",
               "_itemId" : "itemId",
               "_category" : "category",
               "_latitude" : "latitude",
               "_longitude" : "longitude",
               "_name" : "name",
        ]
    }
}
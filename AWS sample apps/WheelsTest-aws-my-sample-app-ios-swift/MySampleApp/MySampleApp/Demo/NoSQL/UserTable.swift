//
//  UserTable.swift
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
import AWSMobileHubHelper

class UserTable: NSObject, Table {
    
    var tableName: String
    var partitionKeyName: String
    var partitionKeyType: String
    var sortKeyName: String?
    var sortKeyType: String?
    var model: AWSDynamoDBObjectModel
    var indexes: [Index]
    var orderedAttributeKeys: [String] {
        return produceOrderedAttributeKeys(model)
    }
    var tableDisplayName: String {

        return "user"
    }
    
    override init() {

        model = User()
        
        tableName = model.classForCoder.dynamoDBTableName()
        partitionKeyName = model.classForCoder.hashKeyAttribute()
        partitionKeyType = "String"
        indexes = [
        ]
        if let sortKeyNamePossible = model.classForCoder.rangeKeyAttribute?() {
            sortKeyName = sortKeyNamePossible
        }
        super.init()
    }
    
    /**
     * Converts the attribute name from data object format to table format.
     *
     * - parameter dataObjectAttributeName: data object attribute name
     * - returns: table attribute name
     */

    func tableAttributeName(_ dataObjectAttributeName: String) -> String {
        return User.jsonKeyPathsByPropertyKey()[dataObjectAttributeName] as! String
    }
    
    func getItemDescription() -> String {
        let hashKeyValue = AWSIdentityManager.default().identityId!
        return "Find Item with userId = \(hashKeyValue)."
    }
    
    func getItemWithCompletionHandler(_ completionHandler: @escaping (_ response: AWSDynamoDBObjectModel?, _ error: NSError?) -> Void) {
        let objectMapper = AWSDynamoDBObjectMapper.default()
        objectMapper.load(User.self, hashKey: AWSIdentityManager.default().identityId!, rangeKey: nil) { (response: AWSDynamoDBObjectModel?, error: Error?) in
            DispatchQueue.main.async(execute: {
                completionHandler(response, error as NSError?)
            })
        }
    }
    
    func scanDescription() -> String {
        return "Show all items in the table."
    }
    
    func scanWithCompletionHandler(_ completionHandler: @escaping (_ response: AWSDynamoDBPaginatedOutput?, _ error: NSError?) -> Void) {
        let objectMapper = AWSDynamoDBObjectMapper.default()
        let scanExpression = AWSDynamoDBScanExpression()
        scanExpression.limit = 5

        objectMapper.scan(User.self, expression: scanExpression) { (response: AWSDynamoDBPaginatedOutput?, error: Error?) in
            DispatchQueue.main.async(execute: {
                completionHandler(response, error as NSError?)
            })
        }
    }
    
    func scanWithFilterDescription() -> String {
        let scanFilterValue = "demo-bio-500000"
        return "Find all items with bio < \(scanFilterValue)."
    }
    
    func scanWithFilterWithCompletionHandler(_ completionHandler: @escaping (_ response: AWSDynamoDBPaginatedOutput?, _ error: NSError?) -> Void) {
        let objectMapper = AWSDynamoDBObjectMapper.default()
        let scanExpression = AWSDynamoDBScanExpression()
        
        scanExpression.filterExpression = "#bio < :bio"
        scanExpression.expressionAttributeNames = ["#bio": "bio" ,]
        scanExpression.expressionAttributeValues = [":bio": "demo-bio-500000" ,]

        objectMapper.scan(User.self, expression: scanExpression) { (response: AWSDynamoDBPaginatedOutput?, error: Error?) in
            DispatchQueue.main.async(execute: {
                completionHandler(response, error as? NSError)
            })
        }
    }
    
    func insertSampleDataWithCompletionHandler(_ completionHandler: @escaping (_ errors: [NSError]?) -> Void) {
        let objectMapper = AWSDynamoDBObjectMapper.default()
        var errors: [NSError] = []
        let group: DispatchGroup = DispatchGroup()
        let numberOfObjects = 20
        

        let itemForGet: User! = User()
        
        itemForGet._userId = AWSIdentityManager.default().identityId!
        itemForGet._bio = NoSQLSampleDataGenerator.randomSampleStringWithAttributeName("bio")
        itemForGet._birthdate = NoSQLSampleDataGenerator.randomSampleStringWithAttributeName("birthdate")
        itemForGet._credits = NoSQLSampleDataGenerator.randomSampleNumber()
        itemForGet._driversLicenseId = NoSQLSampleDataGenerator.randomSampleStringWithAttributeName("drivers_license_id")
        itemForGet._email = NoSQLSampleDataGenerator.randomSampleStringWithAttributeName("email")
        itemForGet._firstName = NoSQLSampleDataGenerator.randomSampleStringWithAttributeName("first_name")
        itemForGet._lastName = NoSQLSampleDataGenerator.randomSampleStringWithAttributeName("last_name")
        itemForGet._password = NoSQLSampleDataGenerator.randomSampleStringWithAttributeName("password")
        itemForGet._phoneNumber = NoSQLSampleDataGenerator.randomSampleStringWithAttributeName("phone_number")
        itemForGet._punctuality = NoSQLSampleDataGenerator.randomSampleNumber()
        itemForGet._ratingAttire = NoSQLSampleDataGenerator.randomSampleNumber()
        itemForGet._ratingNumber = NoSQLSampleDataGenerator.randomSampleNumber()
        itemForGet._ratingPersonality = NoSQLSampleDataGenerator.randomSampleNumber()
        itemForGet._ratingSpeed = NoSQLSampleDataGenerator.randomSampleNumber()
        itemForGet._responseTime = NoSQLSampleDataGenerator.randomSampleNumber()
        itemForGet._userImageDir = NoSQLSampleDataGenerator.randomSampleStringWithAttributeName("user_image_dir")
        
        
        group.enter()
        

        objectMapper.save(itemForGet, completionHandler: {(error: Error?) -> Void in
            if let error = error as? NSError {
                DispatchQueue.main.async(execute: {
                    errors.append(error)
                })
            }
            group.leave()
        })
        
        for _ in 1..<numberOfObjects {

            let item: User = User()
            item._userId = AWSIdentityManager.default().identityId!
            item._bio = NoSQLSampleDataGenerator.randomSampleStringWithAttributeName("bio")
            item._birthdate = NoSQLSampleDataGenerator.randomSampleStringWithAttributeName("birthdate")
            item._credits = NoSQLSampleDataGenerator.randomSampleNumber()
            item._driversLicenseId = NoSQLSampleDataGenerator.randomSampleStringWithAttributeName("drivers_license_id")
            item._email = NoSQLSampleDataGenerator.randomSampleStringWithAttributeName("email")
            item._firstName = NoSQLSampleDataGenerator.randomSampleStringWithAttributeName("first_name")
            item._lastName = NoSQLSampleDataGenerator.randomSampleStringWithAttributeName("last_name")
            item._password = NoSQLSampleDataGenerator.randomSampleStringWithAttributeName("password")
            item._phoneNumber = NoSQLSampleDataGenerator.randomSampleStringWithAttributeName("phone_number")
            item._punctuality = NoSQLSampleDataGenerator.randomSampleNumber()
            item._ratingAttire = NoSQLSampleDataGenerator.randomSampleNumber()
            item._ratingNumber = NoSQLSampleDataGenerator.randomSampleNumber()
            item._ratingPersonality = NoSQLSampleDataGenerator.randomSampleNumber()
            item._ratingSpeed = NoSQLSampleDataGenerator.randomSampleNumber()
            item._responseTime = NoSQLSampleDataGenerator.randomSampleNumber()
            item._userImageDir = NoSQLSampleDataGenerator.randomSampleStringWithAttributeName("user_image_dir")
            
            group.enter()
            
            objectMapper.save(item, completionHandler: {(error: Error?) -> Void in
                if error != nil {
                    DispatchQueue.main.async(execute: {
                        errors.append(error! as NSError)
                    })
                }
                group.leave()
            })
        }
        
        group.notify(queue: DispatchQueue.main, execute: {
            if errors.count > 0 {
                completionHandler(errors)
            }
            else {
                completionHandler(nil)
            }
        })
    }
    
    func removeSampleDataWithCompletionHandler(_ completionHandler: @escaping ([NSError]?) -> Void) {
        let objectMapper = AWSDynamoDBObjectMapper.default()
        let queryExpression = AWSDynamoDBQueryExpression()
        queryExpression.keyConditionExpression = "#userId = :userId"
        queryExpression.expressionAttributeNames = ["#userId": "userId"]
        queryExpression.expressionAttributeValues = [":userId": AWSIdentityManager.default().identityId!,]

        objectMapper.query(User.self, expression: queryExpression) { (response: AWSDynamoDBPaginatedOutput?, error: Error?) in
            if let error = error as? NSError {
                DispatchQueue.main.async(execute: {
                    completionHandler([error]);
                    })
            } else {
                var errors: [NSError] = []
                let group: DispatchGroup = DispatchGroup()
                for item in response!.items {
                    group.enter()
                    objectMapper.remove(item, completionHandler: {(error: Error?) in
                        if let error = error as? NSError {
                            DispatchQueue.main.async(execute: {
                                errors.append(error)
                            })
                        }
                        group.leave()
                    })
                }
                group.notify(queue: DispatchQueue.main, execute: {
                    if errors.count > 0 {
                        completionHandler(errors)
                    }
                    else {
                        completionHandler(nil)
                    }
                })
            }
        }
    }
    
    func updateItem(_ item: AWSDynamoDBObjectModel, completionHandler: @escaping (_ error: NSError?) -> Void) {
        let objectMapper = AWSDynamoDBObjectMapper.default()
        

        let itemToUpdate: User = item as! User
        
        itemToUpdate._bio = NoSQLSampleDataGenerator.randomSampleStringWithAttributeName("bio")
        itemToUpdate._birthdate = NoSQLSampleDataGenerator.randomSampleStringWithAttributeName("birthdate")
        itemToUpdate._credits = NoSQLSampleDataGenerator.randomSampleNumber()
        itemToUpdate._driversLicenseId = NoSQLSampleDataGenerator.randomSampleStringWithAttributeName("drivers_license_id")
        itemToUpdate._email = NoSQLSampleDataGenerator.randomSampleStringWithAttributeName("email")
        itemToUpdate._firstName = NoSQLSampleDataGenerator.randomSampleStringWithAttributeName("first_name")
        itemToUpdate._lastName = NoSQLSampleDataGenerator.randomSampleStringWithAttributeName("last_name")
        itemToUpdate._password = NoSQLSampleDataGenerator.randomSampleStringWithAttributeName("password")
        itemToUpdate._phoneNumber = NoSQLSampleDataGenerator.randomSampleStringWithAttributeName("phone_number")
        itemToUpdate._punctuality = NoSQLSampleDataGenerator.randomSampleNumber()
        itemToUpdate._ratingAttire = NoSQLSampleDataGenerator.randomSampleNumber()
        itemToUpdate._ratingNumber = NoSQLSampleDataGenerator.randomSampleNumber()
        itemToUpdate._ratingPersonality = NoSQLSampleDataGenerator.randomSampleNumber()
        itemToUpdate._ratingSpeed = NoSQLSampleDataGenerator.randomSampleNumber()
        itemToUpdate._responseTime = NoSQLSampleDataGenerator.randomSampleNumber()
        itemToUpdate._userImageDir = NoSQLSampleDataGenerator.randomSampleStringWithAttributeName("user_image_dir")
        
        objectMapper.save(itemToUpdate, completionHandler: {(error: Error?) in
            DispatchQueue.main.async(execute: {
                completionHandler(error as? NSError)
            })
        })
    }
    
    func removeItem(_ item: AWSDynamoDBObjectModel, completionHandler: @escaping (_ error: NSError?) -> Void) {
        let objectMapper = AWSDynamoDBObjectMapper.default()
        
        objectMapper.remove(item, completionHandler: {(error: Error?) in
            DispatchQueue.main.async(execute: {
                completionHandler(error as? NSError)
            })
        })
    }
}

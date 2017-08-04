//
//  CloudLogicAPIInvokeViewController.swift
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
import AWSMobileHubHelper
import AWSAPIGateway

let HTTPMethodGet = "GET"
let HTTPMethodHead = "HEAD"

class CloudLogicAPIInvokeViewController: UIViewController {
    
    @IBOutlet weak var responseTimeLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var apiResponse: UITextView!
    @IBOutlet weak var apiEndpoint: UILabel!
    @IBOutlet weak var methodPath: UITextField!
    @IBOutlet weak var methodName: UILabel!
    @IBOutlet weak var queryStringParameters: UITextField!
    @IBOutlet weak var requestBody: UITextView!
    @IBOutlet weak var requestBodyLabel: UILabel!
    var cloudLogicAPI: CloudLogicAPI?
    var methodPathValue: String?
    var methodNameValue: String?
    var apiEndpointValue: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        methodPath.text = methodPathValue
        methodName.text = methodNameValue
        apiEndpoint.text = apiEndpointValue
        
        // Request Body are not supported on GET http method by API Gateway
        if (methodNameValue == HTTPMethodGet ||
            methodNameValue == HTTPMethodHead) {
            requestBody.text = ""
            requestBodyLabel.isHidden = true
            requestBody.isHidden = true
        }
    }
    
    @IBAction func onClear(_ sender: UIButton) {
        self.requestBody.text = ""
        self.queryStringParameters.text = ""
        self.apiResponse.text = ""
        self.statusLabel.text = ""
        self.responseTimeLabel.text = ""
    }
    @IBAction func onReset(_ sender: UIButton) {
        let defaultRequestBody = "{ \n  \"key1\":\"value1\", \n  \"key2\":\"value2\", \n  \"key3\":\"value3\"\n}"
        let defaultQueryStringParameters = "?lang=en"
        self.requestBody.text = defaultRequestBody
        self.queryStringParameters.text = defaultQueryStringParameters
        self.apiResponse.text = ""
        self.statusLabel.text = ""
        self.responseTimeLabel.text = ""
    }
    @IBAction func onInvokeApi(_ sender: AnyObject) {
        
        let headerParameters = [
            "Content-Type": "application/json",
            "Accept": "application/json"
        ]
        
        var parameters: [String: AnyObject]?
        var queryParameters = [String: String]()
        
        // Parse query string parameters to Dictionary if not empty
        if var queryString = queryStringParameters.text, !queryString.isEmpty {
            // check if the query string begins with a `?`
            if queryString.hasPrefix("?") {
                // remove first character, i.e. `?`
                queryString.remove(at: queryString.startIndex)
                let keyValuePairStringArray = queryString.components(separatedBy: "&")
                // check if there are any key value pairs
                if keyValuePairStringArray.count > 0 {
                    for pairString in keyValuePairStringArray {
                        let keyValue = pairString.components(separatedBy: "=")
                        if keyValue.count == 2 {
                            queryParameters.updateValue(keyValue[1], forKey: keyValue[0])
                        } else if keyValue.count == 1 {
                            queryParameters.updateValue("", forKey: keyValue[0])
                        } else {
                            print("Discarding query string for request: query string malformed.")
                        }
                    }
                }
            } else {
                print("Discarding query string for request: query string must begin with a `?`.")
            }
        }
        
        do {
            // Parse HTTP Body for methods apart from GET / HEAD
            if (methodNameValue != HTTPMethodGet &&
                methodNameValue != HTTPMethodHead) {
                // Parse the HTTP Body to JSON if not empty
                if (!requestBody.text.isEmpty) {
                    let jsonInput = requestBody.text.makeJsonable()
                    let jsonData = jsonInput.data(using: String.Encoding.utf8)!
                    parameters = try JSONSerialization.jsonObject(with: jsonData, options: []) as? [String: AnyObject]
                }
            }
        } catch let error as NSError {
            self.apiResponse.text = "JSON request is not well-formed."
            self.statusLabel.text = ""
            self.responseTimeLabel.text = ""
            
            print("json error: \(error.localizedDescription)")
            return
        }
        
        let apiRequest = AWSAPIGatewayRequest(httpMethod: methodName.text!, urlString: methodPath.text!, queryParameters: queryParameters, headerParameters: headerParameters, httpBody: parameters)
        let startTime = Date()
        
        cloudLogicAPI?.apiClient?.invoke(apiRequest).continueWith(block: {[weak self](task: AWSTask) -> AnyObject? in
            guard let strongSelf = self else { return nil }
            let endTime = Date()
            let timeInterval = endTime.timeIntervalSince(startTime)
            if let error = task.error {
                print("Error occurred: \(error)")
                DispatchQueue.main.async {
                    strongSelf.apiResponse.text = "Error occurred while trying to invoke API: \(error)"
                    strongSelf.statusLabel.text = ""
                    strongSelf.responseTimeLabel.text = ""
                }
                return nil
            }
            
            let result: AWSAPIGatewayResponse! = task.result
            let responseString = String(data: result.responseData!, encoding: String.Encoding.utf8)
            
            print(responseString!)
            print(result.statusCode)
            
            DispatchQueue.main.async {
                strongSelf.statusLabel.text = "\(result.statusCode)"
                strongSelf.apiResponse.text = responseString
                strongSelf.responseTimeLabel.text = String(format:"%.3f s", timeInterval)
            }
            
            return nil
        })
        
    }
}

extension String {
    fileprivate func makeJsonable() -> String {
        let resultComponents: [String] = self.components(separatedBy: CharacterSet.newlines)
        return resultComponents.joined()
    }
}

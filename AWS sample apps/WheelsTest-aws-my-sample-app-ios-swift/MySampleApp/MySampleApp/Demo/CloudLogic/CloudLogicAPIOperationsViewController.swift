//
//  CloudLogicAPIOperationsViewController.swift
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

import UIKit
import Foundation

class CloudLogicAPIOperationsViewController: UITableViewController, APIPathSelectorModalVCDelegate {
    
    @IBOutlet weak var apiEndpoint: UILabel!
    @IBOutlet weak var apiPath: UITextField!
    @IBOutlet weak var getPathLabel: UILabel!
    @IBOutlet weak var putPathLabel: UILabel!
    @IBOutlet weak var postPathLabel: UILabel!
    @IBOutlet weak var deletePathLabel: UILabel!
    @IBOutlet weak var patchPathLabel: UILabel!
    @IBOutlet weak var headPathLabel: UILabel!
    @IBOutlet weak var optionPathLabel: UILabel!
    
    var cloudLogicAPI: CloudLogicAPI?
    var apiPathValue: String?
    
    let methodArray = ["GET", "PUT", "POST",
                       "DELETE","PATCH", "HEAD",
                       "OPTIONS"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let apiPathValue = apiPathValue {
            apiPath.text = apiPathValue
            setMethodLabelText(apiPathValue)
        } else if (cloudLogicAPI!.paths.count >= 1) {
            apiPath.text = cloudLogicAPI!.paths[0]
            setMethodLabelText((cloudLogicAPI!.paths[0]))
        }
        apiEndpoint.text = cloudLogicAPI!.endPoint
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let showInvokerSegue = "CloudLogicAPIShowInvokerSegue"
        performSegue(withIdentifier: showInvokerSegue, sender: indexPath.row)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationViewController = segue.destination as? CloudLogicAPIInvokeViewController {
            destinationViewController.methodPathValue = apiPath.text
            destinationViewController.methodNameValue = methodArray[sender as! Int]
            destinationViewController.apiEndpointValue = apiEndpoint.text
            destinationViewController.cloudLogicAPI = cloudLogicAPI
        }
        
        if let destinationViewController = segue.destination as? APIPathSelectorViewController {
            let cloudLogicAPI = sender as? CloudLogicAPI
            destinationViewController.cloudLogicAPI = cloudLogicAPI
            destinationViewController.delegate = self
        }
    }
    
    func setMethodLabelText(_ text: String) {
        getPathLabel.text = text
        putPathLabel.text = text
        postPathLabel.text = text
        deletePathLabel.text = text
        patchPathLabel.text = text
        headPathLabel.text = text
        optionPathLabel.text = text
    }
    
    func setSelectedValue(_ value : String) {
        self.setMethodLabelText(value)
        self.apiPath.text = value
    }
    
    @IBAction func onBeginEditing(_ sender: UITextField) {
        let showQueryResultSeque = "PathSelectionSegue"
        performSegue(withIdentifier: showQueryResultSeque, sender: self.cloudLogicAPI)
    }
}


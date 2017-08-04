//
//  EngageDescriptionViewController.swift
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
import AWSMobileHubHelper

class EngageDescriptionViewController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: nil, action: nil)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        scrollView.flashScrollIndicators();
    }
    
    
    @IBAction func demoUserEngagementTapped(_ sender: AnyObject) {
        let alert = UIAlertController(title: "Message", message: "No data to display as engagement setup not completed. To complete setup, please save APNS credentials under User Engagement in Mobile Hub.", preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "OK", style: .default, handler: {(action: UIAlertAction)-> Void in
        })
        alert.addAction(defaultAction)
        self.present(alert, animated: true, completion: { _ in })
    }
}
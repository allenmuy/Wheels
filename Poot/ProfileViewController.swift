//
//  ProfileViewController.swift
//  Poot
//
//  Created by Danny on 7/25/17.
//  Copyright © 2017 poots. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    //test image
    let image = UIImage(named: "cree.jpg")
    //image object
    @IBOutlet weak var profileImage: UIImageView!
    
    //label variables
    var firstNamestr = String()
    //label objects
    @IBOutlet weak var firstName: UILabel!
    
    @IBOutlet weak var lastName: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //labels
        firstName.text = firstNamestr
        
        
        //Danny*
        //Profile Image Frame Edit
        profileImage.layer.borderWidth = 1
        profileImage.layer.masksToBounds = false
        profileImage.layer.cornerRadius = profileImage.frame.size.height/2
        profileImage.clipsToBounds = true
        profileImage.contentMode = .scaleAspectFill
        profileImage.image = image
        //
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

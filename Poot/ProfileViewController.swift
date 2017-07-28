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
    
    //reference object
    
    //image object
    @IBOutlet weak var profileImage: UIImageView!
    
    //label variables
    var firstNamestr = "FirstName"
    var lastNamestr = "LastName"
    var aboutMestr = "This is me."
    //label and textview objects
    @IBOutlet weak var aboutMe: UITextView!
    @IBOutlet weak var firstName: UILabel!
    @IBOutlet weak var lastName: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //labels
        loadUserDetails()
        
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
    
    //Button functions
    @IBAction func editTapped(_ sender: Any) {
        var editProfile = self.storyboard?.instantiateViewController(withIdentifier: "EditViewController") as! EditViewController
        editProfile.profileviewReference = self
        
        let editProfileNav = UINavigationController(rootViewController: editProfile)
        self.present(editProfileNav, animated: true, completion: nil)
    }

    @IBAction func backTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    func loadUserDetails()
    {
        firstName.text = firstNamestr
        lastName.text = lastNamestr
        aboutMe.text = aboutMestr
    }
    
}

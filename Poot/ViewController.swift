//
//  ViewController.swift
//  Poot
//
//  Created by Danny on 7/24/17.
//  Copyright © 2017 poots. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    //test image
    let image = UIImage(named: "cree.jpg")
    
    //Danny*
    //let loadingNotification =
    
    //Danny* Created ImageView from Storyboard editor
    //image objects
    @IBOutlet weak var profileImage: UIImageView!
    
    //textfield objects
    
    @IBOutlet weak var firstNameField: UITextField!
    @IBOutlet weak var lastNameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var repeatpasswordField: UITextField!
    
    //Button Objects

    @IBAction func choosePicTapped(_ sender: Any) {
        var pickerController = UIImagePickerController()
        pickerController = UIImagePickerController()
        pickerController.delegate = self;
        pickerController.sourceType = .photoLibrary
        
        present(pickerController, animated: true, completion: nil)
    }
    //UIimageController Fns
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        profileImage.image = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func doneButtonTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    //This button updates and saves the profile
    @IBAction func saveProfile(_ sender: Any) {
    //    let profileImageData = UIImageJPEGRepresentation(profileImage.image, 1}
    
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
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


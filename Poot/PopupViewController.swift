//
//  PopupViewController.swift
//  Poot
//
//  Created by Danny Navarro on 7/27/17.
//  Copyright © 2017 poots. All rights reserved.
//

import UIKit

class PopupViewController: UIViewController {

    @IBOutlet weak var profileImage: UIImageView!
    let image = UIImage(named: "cree.jpg")
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        
        //Danny*
        //Profile Image Frame Edit
        profileImage.layer.borderWidth = 1
        profileImage.layer.masksToBounds = false
        profileImage.layer.cornerRadius = profileImage.frame.size.height/2
        profileImage.clipsToBounds = true
        profileImage.contentMode = .scaleAspectFill
        profileImage.image = image
        //

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func closePopup(_ sender: Any) {
            self.view.removeFromSuperview()
    }
}

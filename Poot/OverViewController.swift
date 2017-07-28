//
//  OverViewController.swift
//  Poot
//
//  Created by Danny Navarro on 7/27/17.
//  Copyright © 2017 poots. All rights reserved.
//

import UIKit

class OverViewController: UIViewController {

    
    @IBOutlet weak var overviewImage: UIImageView!
    @IBOutlet weak var gimage: UIImageView!
    let image = UIImage(named: "gmap.jpg")
    let passengerImage = UIImage(named: "genji.jpg")
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Google Map Image(To be replaced with google API later)
        gimage.contentMode = .scaleAspectFill
        gimage.image = image
        
        //Passenger's image
        overviewImage.layer.borderWidth = 1
        overviewImage.layer.masksToBounds = false
        overviewImage.layer.cornerRadius = overviewImage.frame.size.height/2
        overviewImage.clipsToBounds = true
        overviewImage.contentMode = .scaleAspectFill
        overviewImage.image = passengerImage
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func showPopup(_ sender: Any) {
        let popup = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "PopupViewController") as! PopupViewController
        self.addChildViewController(popup)
        popup.view.frame = self.view.frame
        self.view.addSubview(popup.view)
        popup.didMove(toParentViewController: self)
    }
    
}

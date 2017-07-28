//
//  OverViewController.swift
//  Poot
//
//  Created by Danny Navarro on 7/27/17.
//  Copyright © 2017 poots. All rights reserved.
//

import UIKit

class OverViewController: UIViewController {

    
    @IBOutlet weak var gimage: UIImageView!
    let image = UIImage(named: "gmap.jpg")
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gimage.contentMode = .scaleAspectFill
        gimage.image = image
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

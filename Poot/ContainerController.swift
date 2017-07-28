//
//  ContainerController.swift
//  Poot
//
//  Created by Danny Navarro on 7/27/17.
//  Copyright © 2017 poots. All rights reserved.
//

import UIKit

class ContainerController: UIViewController {
    
    var popupReference: OverViewController!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    /*
     //need to try to get container to show pop up in another view controller
     //notetoself* accidently had 2 button functions of same button
    @IBAction func popupTapped(_ sender: Any) {
        let popup = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "PopupViewController") as! PopupViewController
        self.addChildViewController(popup)
        popup.view.frame = self.view.frame
        self.view.addSubview(popup.view)
        popup.didMove(toParentViewController: self)
    }
 */
}

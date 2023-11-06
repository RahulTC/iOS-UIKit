//
//  ThirdTabViewController.swift
//  TabBarApp
//
//  Created by Rahul Adepu on 11/3/23.
//

import UIKit

class ThirdTabViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func thirdTabSecondViewControllerButton(_ sender: Any) {
        
        // Perform Segue using Segue Identifier
        performSegue(withIdentifier: "ThirdTabSegueID", sender: sender)
    }
}

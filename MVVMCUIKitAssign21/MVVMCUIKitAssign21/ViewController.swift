//
//  ViewController.swift
//  MVVMCUIKitAssign21
//
//  Created by Rahul Adepu on 12/4/23.
//

import UIKit

class ViewController: UIViewController {
    
    weak var mainCoordinator: MainCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func detailsVCButton(_ sender: Any) {
        mainCoordinator?.goToDetailVC()
    }
    
}


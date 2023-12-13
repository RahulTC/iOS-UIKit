//
//  DetailsViewController.swift
//  MVVMCUIKitAssign21
//
//  Created by Rahul Adepu on 12/12/23.
//

import UIKit

class DetailsViewController: UIViewController {

    weak var mainCoordinator: MainCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func thirdVCButton(_ sender: Any) {
        mainCoordinator?.goToThirdVC()
    }
}

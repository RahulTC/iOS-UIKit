//
//  MainCoordinator.swift
//  MVVMCUIKitAssign21
//
//  Created by Rahul Adepu on 12/12/23.
//

import UIKit

protocol Coordinator:AnyObject {
    var childCoordinator: [Coordinator] { get }
    var navigationController : UINavigationController { get set }
    func startCoordinator()
}


class MainCoordinator: Coordinator {
    var childCoordinator: [Coordinator] = []
    
    var navigationController: UINavigationController = UINavigationController()
    
    func startCoordinator() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        vc.mainCoordinator = self
        self.navigationController.pushViewController(vc, animated: true)
    }
    
    func goToDetailVC(){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let detailsVC = storyboard.instantiateViewController(withIdentifier: "DetailsViewController") as! DetailsViewController
        detailsVC.mainCoordinator = self 
        self.navigationController.pushViewController(detailsVC, animated: true)
    }
    
    func goToThirdVC(){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let thirdVC = storyboard.instantiateViewController(withIdentifier: "ThirdViewController")
        
        self.navigationController.pushViewController(thirdVC, animated: true)
    }
    
    
}

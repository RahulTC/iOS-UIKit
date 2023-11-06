//
//  DigimonDetailViewController.swift
//  DigimonApp
//
//  Created by Rahul Adepu on 11/2/23.
//

import UIKit

class DigimonDetailViewController: UIViewController {

    @IBOutlet weak var digimonDetailVCImage: UIImageView!
    @IBOutlet weak var digimonDetailVCNameLabel: UILabel!
    @IBOutlet weak var digimonDetailVCLevelLabel: UILabel!
    
    var digimonDetailImageString: String?
    var digimonName: String?
    var digimonLevel: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setLabelValue()
    }
    
    func setLabelValue(){
        if let url = URL(string: digimonDetailImageString ?? "") {
            digimonDetailVCImage.load(url: url)
        }
        digimonDetailVCNameLabel.text = digimonName ?? "None"
        digimonDetailVCLevelLabel.text = digimonLevel ?? "None"
        
    }


}

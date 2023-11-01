//
//  TrainerDetailViewController.swift
//  Assignment9
//
//  Created by Rahul Adepu on 10/31/23.
//

import UIKit

class TrainerDetailViewController: UIViewController {

    @IBOutlet weak var trainerNameLabel: UILabel!
    @IBOutlet weak var trainerAgeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loadData()
    }
    
    func loadData(){
        trainerNameLabel.text = "Ash Ketchum"
        trainerAgeLabel.text = "10 years"
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }

}

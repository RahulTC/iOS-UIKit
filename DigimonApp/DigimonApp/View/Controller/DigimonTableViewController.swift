//
//  DigimonTableViewController.swift
//  DigimonApp
//
//  Created by Rahul Adepu on 11/2/23.
//

import UIKit

class DigimonTableViewController: UITableViewController {
    
    @IBOutlet var digimonTableView: UITableView!
    
    
    var tableViewModel = TableViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        digimonTableView.dataSource = self
        digimonTableView.delegate  = self
        
        digimonTableView.estimatedRowHeight = 45
        
        //Calling Singleton
        let auth = AuthManager.shared
        auth.doLogin(token: "abcdef")
        
        tableViewModel.refreshUIHandler = {
            DispatchQueue.main.async {
                self.digimonTableView.reloadData()
            }
        }
        
        // Calling function of network manager
        //        tableViewController.callAPIFromNetworkManager()
        tableViewModel.getDataFromNetworkManagerUsingProtocolDelegate()
    }
    
    // MARK: - Table view Data Source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return tableViewModel.digimonList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let digimonListCell = tableView.dequeueReusableCell(withIdentifier: "DigimonTableViewCellID", for: indexPath) as! DigimonTableViewCell
        
        // convert string of url of image to image object
        if let url = URL(string: tableViewModel.digimonList[indexPath.row].img) {
            digimonListCell.digimonListImage.load(url: url)
        }
        digimonListCell.digimonListLabel.text = tableViewModel.digimonList[indexPath.row].name
        digimonListCell.accessoryType = .disclosureIndicator
        return digimonListCell
    }
    
    // MARK: - Table view Delegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboardDigimonListVC = UIStoryboard(name: "Main", bundle: nil)
        let digimonDetailVC = storyboardDigimonListVC.instantiateViewController(withIdentifier: "DigimonDetailViewControllerID") as! DigimonDetailViewController
        
        digimonDetailVC.digimonName = tableViewModel.digimonList[indexPath.row].name
        digimonDetailVC.digimonLevel = tableViewModel.digimonList[indexPath.row].level
        digimonDetailVC.digimonDetailImageString = tableViewModel.digimonList[indexPath.row].img
        
        self.navigationController?.pushViewController(digimonDetailVC, animated: true)
    }
}

//
//  DigimonTableViewController.swift
//  DigimonApp
//
//  Created by Rahul Adepu on 11/2/23.
//

import UIKit

class DigimonTableViewController: UITableViewController {

    @IBOutlet var digimonTableView: UITableView!
    var digimonList = [DigimonModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        digimonTableView.dataSource = self
        digimonTableView.delegate  = self
        
        digimonTableView.estimatedRowHeight = 45
        
        // Calling function of network manager
//        callAPIFromNetworkManager()
        getDataFromNetworkManagerUsingProtocolDelegate()
    }
    
    // MARK: - Network Manager
    func getDataFromNetworkManagerUsingProtocolDelegate(){
        let networkManager = NetworkManager()
        guard let url = URL(string: "https://digimon-api.vercel.app/api/digimon") else {return}
        networkManager.networkDelegate = self
        networkManager.getDataFromAPIusingNetworkProtocol(url: url)
    }
    
    func callAPIFromNetworkManager(){
        let networkManager = NetworkManager()
        guard let url = URL(string: "https://digimon-api.vercel.app/api/digimon") else {return}
        
        networkManager.getDataFromAPI(url: url, modelType: [DigimonModel].self) { result in
            switch result {
            case .success(let digimonListData):
                print(digimonListData)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }

    // MARK: - Table view Data Source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return digimonList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let digimonListCell = tableView.dequeueReusableCell(withIdentifier: "DigimonTableViewCellID", for: indexPath) as! DigimonTableViewCell
        
        // convert string of url of image to image object
        if let url = URL(string: digimonList[indexPath.row].img) {
            digimonListCell.digimonListImage.load(url: url)
        }
        digimonListCell.digimonListLabel.text = digimonList[indexPath.row].name
        digimonListCell.accessoryType = .disclosureIndicator
        return digimonListCell
    }
    
    // MARK: - Table view Delegate

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboardDigimonListVC = UIStoryboard(name: "Main", bundle: nil)
        let digimonDetailVC = storyboardDigimonListVC.instantiateViewController(withIdentifier: "DigimonDetailViewControllerID") as! DigimonDetailViewController
        
        digimonDetailVC.digimonName = digimonList[indexPath.row].name
        digimonDetailVC.digimonLevel = digimonList[indexPath.row].level
        digimonDetailVC.digimonDetailImageString = digimonList[indexPath.row].img
        
        self.navigationController?.pushViewController(digimonDetailVC, animated: true)
    }
}


extension DigimonTableViewController: NetworkResponseProtocol{
    func didFinishWithResoinse(digimonListData: [DigimonModel]) {
        DispatchQueue.main.async {
            self.digimonList.append(contentsOf: digimonListData)
            self.digimonTableView.reloadData()
        }
//                print(result)
    }
    
    func didFinishWithError(error: Error) {
        
    }
    
    
}

//
//  TableViewModel.swift
//  DigimonApp
//
//  Created by Rahul Adepu on 11/9/23.
//

import Foundation

class TableViewModel {
    var digimonList = [DigimonModel]()
    var refreshUIHandler:(()->())?
    
    // MARK: - Network Manager
    func getDataFromNetworkManagerUsingProtocolDelegate(){
        DispatchQueue.global(qos: .utility).async {
            let networkManager = NetworkManager()
            guard let url = URL(string: "https://digimon-api.vercel.app/api/digimon") else {return}
            networkManager.networkDelegate = self
            networkManager.getDataFromAPIusingNetworkProtocol(url: url)
        }
    }
    
    func callAPIFromNetworkManager(){
        DispatchQueue.global(qos: .utility).async {
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
    }
}

extension TableViewModel: NetworkResponseProtocol{
    func didFinishWithResponse(digimonListData: [DigimonModel]) {
        self.digimonList.append(contentsOf: digimonListData)
        self.refreshUIHandler?()
    }
    
    func didFinishWithError(error: Error) {
        
    }
}

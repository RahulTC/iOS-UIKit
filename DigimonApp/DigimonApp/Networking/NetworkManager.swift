//
//  NetworkManager.swift
//  DigimonApp
//
//  Created by Rahul Adepu on 11/2/23.
//

import UIKit

protocol NetworkableProtocol {
    func getDataFromAPI<T:Decodable>(url: URL, modelType:T.Type, completionHandler: @escaping (Result<T, Error>) -> Void)
}

class NetworkManager: NetworkableProtocol {
    
    var networkDelegate:NetworkResponseProtocol?
    
    func getDataFromAPI<T>(url: URL, modelType: T.Type, completionHandler: @escaping (Result<T, Error>) -> Void) where T : Decodable {
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                completionHandler(.failure(error))
                print(error.localizedDescription)
            }
            
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                print("Got invalid response")
                return
            }
            
            guard let rawData = data else{
                print("Couldn't get the data")
                return
            }
            
            do{
                let result = try JSONDecoder().decode(modelType, from: rawData)
                completionHandler(.success(result))
            }catch{
                completionHandler(.failure(error))
                print(error.localizedDescription)
            }
        }.resume()
    }
    
    func getDataFromAPIusingNetworkProtocol(url: URL) {
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if let error = error {
                print(error.localizedDescription)
                self.networkDelegate?.didFinishWithError(error: error)
            }
            
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                print("Got invalid response")
                return
            }
            
            guard let rawData = data else{
                print("Couldn't get the data")
                return
            }
            
            do{
                let result = try JSONDecoder().decode([DigimonModel].self, from: rawData)
                self.networkDelegate?.didFinishWithResponse(digimonListData: result)
            }catch{
                self.networkDelegate?.didFinishWithError(error: error)
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
}

protocol NetworkResponseProtocol{
    func didFinishWithResponse(digimonListData:[DigimonModel])
    func didFinishWithError(error: Error)
}

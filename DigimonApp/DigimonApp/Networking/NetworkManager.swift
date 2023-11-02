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
    func getDataFromAPI<T>(url: URL, modelType: T.Type, completionHandler: @escaping (Result<T, Error>) -> Void) where T : Decodable {
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
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
                print(error.localizedDescription)
            }
        }.resume()
    }
}

//
//  LeaguesNetworkManager.swift
//  Sports
//
//  Created by Mohamed Mahgoub on 12/08/2024.
//

import Foundation
import Alamofire

protocol NetworkManagerProtocol {
    func getLeaguesFromAPI(sport : String ,handler : @escaping (([Leagues]) -> Void))
}

class NetworkManager : NetworkManagerProtocol {
    
    func getLeaguesFromAPI(sport : String ,handler : @escaping (([Leagues]) -> Void)) {
        let url = URL(string: "https://apiv2.allsportsapi.com/\(sport)")
        guard let url = url else { return }
       // let request = AF.request(url, method: .get , encoding: JSONEncoding.default)
        let param = ["met" : "Leagues","APIkey" : Constants.apiKey]
        let request = AF.request(url, method: .get, parameters: param, encoding: URLEncoding.default)
        request.responseData { responseData in
            switch responseData.result {
            case .success(let data) :
                do{
                    let jsonDecoder = JSONDecoder()
                    let leagues = try jsonDecoder.decode(LeaguesResponse.self, from: data)
                    print(data)
                    handler(leagues.result)
                }catch{
                    print("Error")
                }
            case .failure(_):
                print("Error")
            }
        }
    }
}
class Constants {
    static let apiKey = "2c28d4947373c9aad33c4b48c0f99c79ce4469f4c59f207b0ee9d8f73d2ae9e2"
}

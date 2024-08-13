//
//  LeaguesNetworkManager.swift
//  Sports
//
//  Created by Mohamed Mahgoub on 12/08/2024.
//

import Foundation
import Alamofire

protocol LeaguesNetworkManagerProtocol {
    func getLeaguesFromAPI()
}

class LeaguesNetworkManager : LeaguesNetworkManagerProtocol {
    
    var view : ViewControllerProtocol?
    
    func getLeaguesFromAPI() {
        view = ViewController()
        let url = URL(string: "https://apiv2.allsportsapi.com/football/?met=Leagues&APIkey=\(Constants.apiKey)")
        guard let url = url else { return }
        
        let request = AF.request(url, method: .get , encoding: JSONEncoding.default)
        request.responseData { responseData in
            switch responseData.result {
            case .success(let data) :
                do{
                    let jsonDecoder = JSONDecoder()
                    jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
                    let leagues = try jsonDecoder.decode(LeaguesResponse.self, from: data)
                    print(String(data: data, encoding: .utf8) ?? "No data")
                    DispatchQueue.main.async {
                        self.view?.fetchData(leagues: leagues.result)
                    }
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
    static let apiKey = "5314156768edc247cca20a1ffd32df1761e66112a98bd235de51f9c1d13e2d4d"
}

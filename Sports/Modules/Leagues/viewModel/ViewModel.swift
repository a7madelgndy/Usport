//
//  ViewModel.swift
//  Sports
//
//  Created by Mohamed Mahgoub on 13/08/2024.
//

import Foundation

protocol ViewModelProtocol : AnyObject{
    var leagues : [Leagues] { get set }
    var bindDataToViewController: (()->()) { get set  }
    func getData()
}

class ViewModel: ViewModelProtocol {
    
    var sport : String
    var leagues : [Leagues] = []
    var networkManager : NetworkManagerProtocol
    var bindDataToViewController: (() -> ()) = {}
    
    init(sport: String = "football",networkManager: NetworkManagerProtocol = NetworkManager() ){
        self.sport = sport
        self.networkManager = networkManager
    }
    func getData() {
        networkManager.getLeaguesFromAPI(sport: sport) {[weak self] leagues in
            guard let self else { return }
            self.leagues = leagues
            self.bindDataToViewController()
        }
    }

    
}

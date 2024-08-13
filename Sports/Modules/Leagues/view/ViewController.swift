//
//  ViewController.swift
//  Sports
//
//  Created by Mohamed Mahgoub on 12/08/2024.
//

import UIKit
import Kingfisher

protocol ViewControllerProtocol {
    func fetchData(leagues : [Leagues])
}

class ViewController: UIViewController {
    
    var leagues : [Leagues] = []
    var LNWManager : LeaguesNetworkManagerProtocol?

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var imageForEmpty: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.RegisterNib(cell: TableViewCell.self)
        LNWManager = LeaguesNetworkManager()
        LNWManager?.getLeaguesFromAPI()
        isEmpty()

    }
    func isEmpty() {
        if leagues.count == 0 {
            tableView.isHidden = true
            imageForEmpty.isHidden = false
        }else{
            tableView.isHidden = false
            imageForEmpty.isHidden = true
            
        }
    }
    func fetchData(leagues : [Leagues]) {
        self.leagues = leagues
        self.tableView.reloadData()

    }

}

extension ViewController : UITableViewDelegate,UITableViewDataSource,ViewControllerProtocol {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return leagues.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        let league = leagues[indexPath.row]
        cell.leagueImage.image = UIImage(named: league.leagueLogo!)
        cell.leagueName.text = league.leagueName
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension  UITableView {
    func RegisterNib<cell : UITableViewCell>(cell : cell.Type) {
        
        
        let nibName = String(describing : cell)
        
        self.register(UINib(nibName: nibName, bundle: nil), forCellReuseIdentifier: nibName)
    }
    
    func dequeue<cell : UITableViewCell>() -> cell {
        
        _ = String(describing: cell.self)
        guard let cell = self.dequeueReusableCell(withIdentifier: "TableViewCell") as? cell else {
            fatalError("error in cell")
        }
        
        return cell
    }
   
    
    
}


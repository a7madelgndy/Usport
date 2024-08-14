//
//  ViewController.swift
//  Sports
//
//  Created by Mohamed Mahgoub on 12/08/2024.
//

import UIKit
import Kingfisher

class ViewController: UIViewController {
    
    var viewModel : LeaguesViewModelProtocol?
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var imageForEmpty: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.RegisterNib(cell: TableViewCell.self)
        viewModel = LeaguesViewModel()
        viewModel?.getData()
        viewModel?.bindDataToViewController = { [weak self] in
            guard let self else { return  }
            DispatchQueue.main.async {
                self.tableView.reloadData()
                self.isEmpty()
            }
        }
    }
    func isEmpty() {
        if viewModel?.leagues.count == 0 {
            tableView.isHidden = true
            imageForEmpty.isHidden = false
        }else{
            tableView.isHidden = false
            imageForEmpty.isHidden = true
            
        }
    }
}
extension ViewController : UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (viewModel?.leagues.count) ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        let league = viewModel?.leagues[indexPath.row]
        let image = URL(string: (league?.leagueLogo) ?? "")
        cell.leagueImage.kf.setImage(with: image, placeholder: UIImage(named: "noImage"))
        cell.leagueImage.layer.cornerRadius = cell.leagueImage.frame.width / 2
        cell.leagueName.text = league?.leagueName
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
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


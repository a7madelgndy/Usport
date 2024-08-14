//
//  HomeViewController.swift
//  Sports
//
//  Created by Ahmed El Gndy on 14/08/2024.
//

import UIKit

class HomeViewController: UIViewController ,UICollectionViewDelegate,UICollectionViewDataSource ,UICollectionViewDelegateFlowLayout{

    @IBOutlet var collectionVeiw: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionVeiw.delegate = self
        collectionVeiw.dataSource = self
        // Do any additional setup after loading the view.
      

    }
    

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! HomeCollectionViewCell
        switch(indexPath.row){
        case 0:
            cell.sportImg.image = UIImage(named: "football.jpg")
            cell.sportLbl.text = "Football"
        case 1 :
            cell.sportImg.image = UIImage(named: "basketbell.jpg")
            cell.sportLbl.text = "basketball"
        case 2 :
            cell.sportImg.image = UIImage(named: "cricket.jpg")
            cell.sportLbl.text = "cricket"
        case 3 :
            cell.sportImg.image = UIImage(named: "tennis.jpg")
            cell.sportLbl.text = "tennis"
        default:
            cell.sportImg.image = UIImage(named: "basketbell.jpg")
            cell.sportLbl.text = "basketball"
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.width*0.45, height: self.view.frame.width*0.7)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "leagus", sender: indexPath.row)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "leagus" {
                // Pass data to the destination view controller if needed
                if segue.destination is ViewController {
                }
            }
        }
   /* func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter?.didSelectSport(at: indexPath.row)
    }*/

}

//
//  SportsCollectionViewController.swift
//  Sports
//
//  Created by Mohamed Mahgoub on 13/08/2024.
//

import UIKit

class SportsCollectionViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: "CollectionViewCell", bundle: nil)
        
        collectionView.register(nib, forCellWithReuseIdentifier: "CollectionViewCell")
        
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
    }
    
    
}

extension SportsCollectionViewController : UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        
        cell.sportName.text = "Sports"
        cell.sportImage.image = UIImage(systemName: "camera")
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width:100, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = self.storyboard?.instantiateViewController(identifier: "vc") as? ViewController
        
        guard let vc = vc else { return  }
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
}


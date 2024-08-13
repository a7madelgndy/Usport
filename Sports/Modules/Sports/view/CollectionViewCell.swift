//
//  CollectionViewCell.swift
//  Sports
//
//  Created by Mohamed Mahgoub on 13/08/2024.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var sportImage: UIImageView!
    
    
    @IBOutlet weak var sportName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

}

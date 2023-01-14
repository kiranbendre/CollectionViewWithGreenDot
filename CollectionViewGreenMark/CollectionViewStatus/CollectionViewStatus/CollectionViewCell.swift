//
//  CollectionViewCell.swift
//  CollectionViewStatus
//
//  Created by Iphone XR on 31/12/22.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var statusImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        statusImage.layer.cornerRadius = 15
        statusImage.layer.masksToBounds = true
    }

}

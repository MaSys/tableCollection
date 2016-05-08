//
//  CollectionViewCell.swift
//  TableCollection
//
//  Created by Yaser Almasri on 5/8/16.
//  Copyright © 2016 MaSys Development. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var imageView: UIImageView!
    
    @IBOutlet var checkImageView: UIImageView!
    
    var checked: Bool = false {
        didSet {
            if (checked) {
                self.checkImageView.image = UIImage(named: "Checked")
            }
            else {
                self.checkImageView.image = UIImage(named: "Unchecked")
            }
        }
    }
}

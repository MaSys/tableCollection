//
//  TableViewCell.swift
//  TableCollection
//
//  Created by Yaser Almasri on 5/8/16.
//  Copyright © 2016 MaSys Development. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    @IBOutlet var collectionView: UICollectionView!
    var checkedIndexPaths: NSMutableSet = NSMutableSet()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

extension TableViewCell : UICollectionViewDataSource {
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 12
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("CCell", forIndexPath: indexPath) as! CollectionViewCell
        cell.checked = self.checkedIndexPaths.member(indexPath) != nil
        
        // Configure the cell
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        print(indexPath)
        let cell = collectionView.cellForItemAtIndexPath(indexPath) as! CollectionViewCell
        if ((self.checkedIndexPaths.member(indexPath)) != nil) {
            self.checkedIndexPaths.removeObject(indexPath)
            cell.checked = false
        }
        else {
            self.checkedIndexPaths.addObject(indexPath)
            cell.checked = true
        }
    }
    
}

extension TableViewCell : UICollectionViewDelegateFlowLayout {
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        let itemsPerRow:CGFloat = 4
        let hardCodedPadding:CGFloat = 5
        let itemWidth = (collectionView.bounds.width / itemsPerRow) - hardCodedPadding
        let itemHeight = collectionView.bounds.height - (2 * hardCodedPadding)
        return CGSize(width: itemWidth, height: itemHeight)
    }
    
}
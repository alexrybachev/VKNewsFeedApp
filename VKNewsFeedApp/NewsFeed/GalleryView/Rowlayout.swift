//
//  Rowlayout.swift
//  VKNewsFeedApp
//
//  Created by Aleksandr Rybachev on 06.01.2023.
//

import Foundation
import UIKit

protocol RowLayoutDelegate: AnyObject {
    
    func collectionView(_ collectionView: UICollectionView, photoAtIndexPath indexPath: IndexPath) -> CGSize
}

class Rowlayout: UICollectionViewLayout {
    
    weak var delegate: RowLayoutDelegate!
    
    fileprivate var numberOfRows = 1
    
    fileprivate var cellPadding: CGFloat = 8
    
    fileprivate var cache = [UICollectionViewLayoutAttributes]()
    
    fileprivate var contentWidth: CGFloat = 0
    
    fileprivate var contentHeight: CGFloat {
        guard let collectionView = collectionView else { return 0 }
        let insert = collectionView.contentInset
        return collectionView.bounds.height - (insert.left + insert.right)
    }
    
    override var collectionViewContentSize: CGSize {
        return CGSize(width: contentWidth, height: contentHeight  )
    }
    
    override func prepare() {
        guard cache.isEmpty == true, let collectionView = collectionView else { return }
            
        var photos = [CGSize]()
        
        for item in 0..<collectionView.numberOfItems(inSection: 0) {
            let indexPath = IndexPath(item: item, section: 0)
            let photoSize = delegate.collectionView(collectionView, photoAtIndexPath: indexPath)
            photos.append(photoSize)
        }
        
        let superviewWidth = collectionView.frame.width
        
        guard let rowHeight = self.rowHeightCounter(superviewWidth: superviewWidth, photosArray: photos) else { return }
        
    }
    
    private func rowHeightCounter(superviewWidth: CGFloat, photosArray: [CGSize]) -> CGFloat? {
        var rowHeight: CGFloat
        
        let photoWithMinRatio = photosArray.min { (first, second) -> Bool in
            (first.height / first.width) < (second.height / second.width)
        }
        
        guard let myPhotoWithMinRatio = photoWithMinRatio else { return nil }
        
        let difference = superviewWidth / myPhotoWithMinRatio.width
        
        rowHeight = myPhotoWithMinRatio.height * difference
        
        return rowHeight
    }
}

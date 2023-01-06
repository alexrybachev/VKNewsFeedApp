//
//  GalleryCollectionView.swift
//  VKNewsFeedApp
//
//  Created by Aleksandr Rybachev on 06.01.2023.
//

import Foundation
import UIKit

class GalleryCollectionView: UICollectionView {
    
    var photos = [FeedCellPhotoAttachmentViewModel]()
    
    init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let rowLayout = Rowlayout()
        super.init(frame: .zero, collectionViewLayout: rowLayout)
        
        delegate = self
        dataSource = self
        
        backgroundColor = .blue
        
        register(GalleryCollectionViewCell.self, forCellWithReuseIdentifier: GalleryCollectionViewCell.reuseId)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(photos: [FeedCellPhotoAttachmentViewModel]) {
        self.photos = photos
        reloadData()
    }
}

// MARK: - UICollectionViewDataSource
extension GalleryCollectionView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = dequeueReusableCell(withReuseIdentifier: GalleryCollectionViewCell.reuseId, for: indexPath) as! GalleryCollectionViewCell
        cell.set(imageURL: photos[indexPath.row].photoURLString)
        
        return cell
    }
    
    
}

// MARK: - UICollectionViewDelegate
extension GalleryCollectionView: UICollectionViewDelegate {
    
}

// MARK: - UICollectionViewDelegateFlowLayout
//extension GalleryCollectionView: UICollectionViewDelegateFlowLayout {
//    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: frame.width, height: frame.height)
//    }
//}

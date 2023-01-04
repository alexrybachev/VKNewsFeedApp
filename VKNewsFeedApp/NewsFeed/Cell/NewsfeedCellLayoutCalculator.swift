//
//  NewsfeedCellLayoutCalculator.swift
//  VKNewsFeedApp
//
//  Created by Aleksandr Rybachev on 02.01.2023.
//

import Foundation
import UIKit

protocol FeedCellLayoutCalculatorProtocol {
    func sizes(postText: String?, photoAttachment: FeedCellPhotoAttachmentViewModel?) -> FeedCellSizes
}

struct Sizes: FeedCellSizes {
    var postLabelFrame: CGRect
    var attachmentFrame: CGRect
    var bottomViewFrame: CGRect
    var totalHeight: CGFloat
}

struct Constanst {
    static let cardInsets = UIEdgeInsets(top: 0, left: 8, bottom: 12, right: 8)
    static let topViewHeight: CGFloat = 36
    static let postLabelInsert = UIEdgeInsets(top: 8 + Self.topViewHeight, left: 8, bottom: 8, right: 8)
    static let postLabelFont = UIFont.systemFont(ofSize: 15)
    static let bottomViewHeight: CGFloat = 44
}

final class FeedCellLayoutCalculator: FeedCellLayoutCalculatorProtocol {

    private let screenWidth: CGFloat
    
    init(screenWidth: CGFloat = min(UIScreen.main.bounds.width, UIScreen.main.bounds.height)) {
        self.screenWidth = screenWidth
    }
    
    func sizes(postText: String?, photoAttachment: FeedCellPhotoAttachmentViewModel?) -> FeedCellSizes {
        let cardViewWidth = screenWidth - Constanst.cardInsets.left - Constanst.cardInsets.right
        
        // MARK: - Work with postLabelFrame
        var postLabelFrame = CGRect(origin: CGPoint(x: Constanst.postLabelInsert.left, y: Constanst.postLabelInsert.top),
                                    size: CGSize.zero)
        
        if let text = postText, !text.isEmpty {
            let width = cardViewWidth - Constanst.postLabelInsert.left - Constanst.postLabelInsert.right
            let height = text.height(width: width, font: Constanst.postLabelFont)
            
            postLabelFrame.size = CGSize(width: width, height: height)
        }
        
        // MARK: - Work with attachmentFrame
        
        let attachmentTop = postLabelFrame.size == CGSize.zero ? Constanst.postLabelInsert.top : postLabelFrame.maxY + Constanst.postLabelInsert.bottom
        
        var attachmentFrame = CGRect(origin: CGPoint(x: 0, y: attachmentTop),
                                    size: CGSize.zero)
        if let attachment = photoAttachment {
            let photoHeight: Float = Float(attachment.height)
            let photoWidth: Float = Float(attachment.width)
            let ratio = CGFloat(photoHeight / photoWidth)
            attachmentFrame.size = CGSize(width: cardViewWidth,
                                         height: cardViewWidth * ratio)
        }
        
        // MARK: - Work with bottomViewFrame
        
        let bottomViewTop = max(postLabelFrame.maxY, attachmentFrame.maxY)
        
        let bottomViewFrame = CGRect(origin: CGPoint(x: 0, y: bottomViewTop),
                                     size: CGSize(width: cardViewWidth, height: Constanst.bottomViewHeight))
        
        // MARK: - Work with totalHeightFrame
        
        let totalHeight = bottomViewFrame.maxY + Constanst.cardInsets.bottom
        
        return Sizes(
            postLabelFrame: postLabelFrame,
            attachmentFrame: attachmentFrame,
            bottomViewFrame: bottomViewFrame,
            totalHeight: totalHeight
        )
    }
}

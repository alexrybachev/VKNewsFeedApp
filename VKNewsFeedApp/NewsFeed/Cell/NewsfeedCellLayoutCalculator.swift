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
    var moreTextButtonFrame: CGRect
}

final class FeedCellLayoutCalculator: FeedCellLayoutCalculatorProtocol {

    private let screenWidth: CGFloat
    
    init(screenWidth: CGFloat = min(UIScreen.main.bounds.width, UIScreen.main.bounds.height)) {
        self.screenWidth = screenWidth
    }
    
    func sizes(postText: String?, photoAttachment: FeedCellPhotoAttachmentViewModel?) -> FeedCellSizes {
        
        var showMoreTextButton = false
        
        let cardViewWidth = screenWidth - Constanst.cardInsets.left - Constanst.cardInsets.right
        
        // MARK: - Work with postLabelFrame
        var postLabelFrame = CGRect(origin: CGPoint(x: Constanst.postLabelInsert.left, y: Constanst.postLabelInsert.top),
                                    size: CGSize.zero)
        
        if let text = postText, !text.isEmpty {
            let width = cardViewWidth - Constanst.postLabelInsert.left - Constanst.postLabelInsert.right
            var height = text.height(width: width, font: Constanst.postLabelFont)
            
            let limitHeight = Constanst.postLabelFont.lineHeight * Constanst.minifiedPostLimitLines
            
            if height > limitHeight {
                height = Constanst.postLabelFont.lineHeight * Constanst.minifiedPostLines
                showMoreTextButton = true
            }
            
            postLabelFrame.size = CGSize(width: width, height: height)
        }
        
        // MARK: - Work with moreTextButtonFrame
        
        var moreTextButtonSize = CGSize.zero
        
        if showMoreTextButton {
            moreTextButtonSize = Constanst.moreTextButtonSize
        }
        
        let moreTextButtonOrigin = CGPoint(x: Constanst.moreTextButtonInserts.left, y: postLabelFrame.maxY)
        
        let moretextButtonFrame = CGRect(origin: moreTextButtonOrigin, size: moreTextButtonSize)
        
        // MARK: - Work with attachmentFrame
        
        let attachmentTop = postLabelFrame.size == CGSize.zero ? Constanst.postLabelInsert.top : moretextButtonFrame.maxY + Constanst.postLabelInsert.bottom
        
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
            totalHeight: totalHeight,
            moreTextButtonFrame: moretextButtonFrame
        )
    }
}

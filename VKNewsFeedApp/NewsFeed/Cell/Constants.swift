//
//  Constants.swift
//  VKNewsFeedApp
//
//  Created by Aleksandr Rybachev on 05.01.2023.
//

import Foundation
import UIKit

struct Constanst {
    static let cardInsets = UIEdgeInsets(top: 0, left: 8, bottom: 12, right: 8)
    static let topViewHeight: CGFloat = 36
    static let postLabelInsert = UIEdgeInsets(top: 8 + Constanst.topViewHeight, left: 8, bottom: 8, right: 8)
    static let postLabelFont = UIFont.systemFont(ofSize: 15)
    static let bottomViewHeight: CGFloat = 44
    
    static let bottomViewViewWidth: CGFloat = 80
    static let bottomViewViewsIconSize: CGFloat = 24
    
    static let minifiedPostLimitLines: CGFloat = 8
    static let minifiedPostLines: CGFloat = 6
    
    static let moreTextButtonSize = CGSize(width: 170, height: 30)
    static let moreTextButtonInserts = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 0)
}

//
//  NewsfeedCodeCell.swift
//  VKNewsFeedApp
//
//  Created by Aleksandr Rybachev on 05.01.2023.
//

import Foundation
import UIKit

final class NewsfeedCodeCell: UITableViewCell {
    
    static let reuseId = "NewsfeedCodeCell"
    
    let cardView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        
        addSubview(cardView)
        // cardView constraints
        
//        cardView.fillSuperview(padding: UIEdgeInsets(top: 6, left: 6, bottom: 6, right: 6))
//        cardView.fillSuperview()
        cardView.anchor(top: topAnchor,
                        leading: leadingAnchor,
                        bottom: nil,
                        trailing: nil,
                        padding: UIEdgeInsets(top: 8, left: 8, bottom: 777, right: 777),
                        size: CGSize(width: 40, height: 40))
        
//        cardView.topAnchor.constraint(equalTo: topAnchor, constant: 6).isActive = true
//        cardView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -6).isActive = true
//        cardView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -6).isActive = true
//        cardView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 6).isActive = true
        
//        cardView.topAnchor.constraint(equalTo: topAnchor, constant: 8).isActive = true
//        cardView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8).isActive = true
//        cardView.heightAnchor.constraint(equalToConstant: 40).isActive = true
//        cardView.widthAnchor.constraint(equalToConstant: 40).isActive = true
        
//        cardView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12).isActive = true
//        cardView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
//        cardView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
//        cardView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
//        cardView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
//        cardView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
//        cardView.topAnchor.constraint(equalTo: topAnchor).isActive = true
//        cardView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 1/2).isActive = true
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}

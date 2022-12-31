//
//  API.swift
//  VKNewsFeedApp
//
//  Created by Aleksandr Rybachev on 31.12.2022.
//

import Foundation

struct API {
    static let scheme = "https"
    static let host = "api.vk.com"
    static let version = "5.131" // "5.92"
    
    static let newsFeed = "/method/newsfeed.get"
}

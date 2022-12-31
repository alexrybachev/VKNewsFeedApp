//
//  FeedResponse.swift
//  VKNewsFeedApp
//
//  Created by Aleksandr Rybachev on 31.12.2022.
//

import Foundation

struct FeedResponseWrapped: Codable {
    let response: FeedResponse
}

struct FeedResponse: Codable {
    var items: [FeedItem]
}

struct FeedItem: Codable {
    let sourceId: Int
    let postId: Int
    let text: String?
    let date: Double
    let comments: CountableItem?
    let likes: CountableItem?
    let reposts: CountableItem?
    let views: CountableItem?
}

struct CountableItem: Codable {
    let count: Int
}

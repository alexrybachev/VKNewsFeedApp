//
//  NewsfeedModels.swift
//  VKNewsFeedApp
//
//  Created by Aleksandr Rybachev on 31.12.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

enum Newsfeed {
    
    enum Model {
        struct Request {
            enum RequestType {
                case getNewsfeed
            }
        }
        struct Response {
            enum ResponseType {
                case presentNewsfeed(feed: FeedResponse)
            }

        }
        struct ViewModel {
            enum ViewModelData {
                case displayNewsfeed(feedViewModel: FeedViewModel)
            }
        }
    }
    
}

struct FeedViewModel {
    
    struct Cell: FeedCellViewModel {
        var iconURLString: String
        var name: String
        var date: String
        var text: String?
        var likes: String?
        var comments: String?
        var shares: String?
        var views: String?
    }
    
    let cells: [Cell]
}

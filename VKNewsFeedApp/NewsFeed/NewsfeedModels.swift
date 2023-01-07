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
                case getUser
                case revealPostIds(postId: Int)
            }
        }
        struct Response {
            enum ResponseType {
                case presentNewsfeed(feed: FeedResponse, revealsPostIds: [Int])
                case presentUserInfo(user: UserResponse?)
            }

        }
        struct ViewModel {
            enum ViewModelData {
                case displayNewsfeed(feedViewModel: FeedViewModel)
                case displayUser(userViewModel: UserViewModel)
            }
        }
    }
    
}

struct UserViewModel: TitleViewViewModel {
    var photoURLString: String?
}

struct FeedViewModel {
    
    struct Cell: FeedCellViewModel {
        var postId: Int
        
        var iconURLString: String
        var name: String
        var date: String
        var text: String?
        var likes: String?
        var comments: String?
        var shares: String?
        var views: String?
        var photoAttachments: [FeedCellPhotoAttachmentViewModel]
        var sizes: FeedCellSizes
    }
   
    struct FeedCellPhotoAttachment: FeedCellPhotoAttachmentViewModel {
        var photoURLString: String?
        var width: Int
        var height: Int
    }
    
    let cells: [Cell]
}

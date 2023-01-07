//
//  NewsfeedInteractor.swift
//  VKNewsFeedApp
//
//  Created by Aleksandr Rybachev on 31.12.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol NewsfeedBusinessLogic {
    func makeRequest(request: Newsfeed.Model.Request.RequestType)
}

class NewsfeedInteractor: NewsfeedBusinessLogic {
    
    var presenter: NewsfeedPresentationLogic?
    var service: NewsfeedService?
    
    //    private var revealedPostIds = [Int]()
    //    private var feedResponse: FeedResponse?
    
    //    private var fetcher: DataFetcher = NetworkDataFetcher(networking: NetworkService())
    
    func makeRequest(request: Newsfeed.Model.Request.RequestType) {
        if service == nil {
            service = NewsfeedService()
        }
        
        switch request {
        case .getNewsfeed:
            service?.getFeed(completion: { [weak self] revealedPostIds, feed in
                self?.presenter?.presentData(response: .presentNewsfeed(feed: feed, revealsPostIds: revealedPostIds))
            })
        case .getUser:
            service?.getUser(completion: { [weak self] user in
                self?.presenter?.presentData(response: .presentUserInfo(user: user))
            })
        case .revealPostIds(postId: let postId):
            service?.revealPostIds(forPostId: postId, completion: { [weak self] revealedPostIds, feed in
                self?.presenter?.presentData(response: .presentNewsfeed(feed: feed, revealsPostIds: revealedPostIds))
            })
        case .getNextBatch:
            print("123")
            service?.getNextBatch(completion: { [weak self] revealedPostIds, feed in
                self?.presenter?.presentData(response: .presentNewsfeed(feed: feed, revealsPostIds: revealedPostIds))
            })
        }
    }
}
        
//        switch request {
//        case .getNewsfeed:
//            fetcher.getFeed { [weak self] feedResponse in
//                self?.feedResponse = feedResponse
//                self?.presentFeed()
//            }
//        case .revealPostIds(postId: let postId):
//            revealedPostIds.append(postId)
//            presentFeed()
//        case .getUser:
//            fetcher.getUser { userResponse in
//                self.presenter?.presentData(response: .presentUserInfo(user: userResponse))
//            }
//        }
//    }
    
//    private func presentFeed() {
//        guard let feedResponse = feedResponse else { return }
//        presenter?.presentData(response: .presentNewsfeed(feed: feedResponse, revealsPostIds: revealedPostIds))
//    }
//}

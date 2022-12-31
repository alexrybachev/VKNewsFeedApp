//
//  FeedViewController.swift
//  VKNewsFeedApp
//
//  Created by Aleksandr Rybachev on 30.12.2022.
//

import UIKit

class FeedViewController: UIViewController {
    
    private let networkService = NetworkService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBlue
//        networkService.request(path: <#T##String#>, params: <#T##[String : String]#>, completion: <#T##(Data?, Error?) -> Void#>)
//        networkService.getFeed()
    }
}

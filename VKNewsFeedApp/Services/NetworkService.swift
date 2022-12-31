//
//  NetworkService.swift
//  VKNewsFeedApp
//
//  Created by Aleksandr Rybachev on 31.12.2022.
//

import Foundation

protocol Networking {
    func request(path: String, params: [String: String], completion: @escaping (Data?, Error?) -> Void)
}

final class NetworkService: Networking {
    
    private let authService: AuthService
    
    init(authService: AuthService = SceneDelegate.shared().authService) {
        self.authService = authService
    }
    
    func request(path: String, params: [String: String], completion: @escaping (Data?, Error?) -> Void) {
        guard let token = authService.token else { return }
        print("TOKEN: \(token)")
        
        let params = ["filters": "post,photo"]
        var allparams = params
        allparams["access_token"] = token
        allparams["v"] = API.version
        
        let url = url(from: path, params: allparams)
        print(url)
        
        let request = URLRequest(url: url)
        let task = createDataTask(from: request, completion: completion)
        task.resume()
    }
    
    private func createDataTask(from request: URLRequest, completion: @escaping (Data?, Error?) -> Void) -> URLSessionDataTask {
        URLSession.shared.dataTask(with: request) { data, _, error in
            DispatchQueue.main.async {
                completion(data, error)
            }
        }
    }
    
    private func url(from path: String, params: [String: String]) -> URL {
        var components = URLComponents()
        components.scheme = API.scheme
        components.host = API.host
        components.path = path
        components.queryItems = params.map { URLQueryItem(name: $0, value: $1) }
        
        return components.url!
    }
}

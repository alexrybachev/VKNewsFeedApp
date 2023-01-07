//
//  AuthService.swift
//  VKNewsFeedApp
//
//  Created by Aleksandr Rybachev on 25.08.2022.
//

import Foundation
import VK_ios_sdk

protocol AuthServiceDelegate: AnyObject {
    func authServiceShouldShow(_ viewController: UIViewController)
    func authServiceSignIn()
    func authServiceSignInDidFail()
}

class AuthService: NSObject, VKSdkDelegate, VKSdkUIDelegate {
    
    private let appID = "51410477"
    private let vkSDK: VKSdk
    
    weak var delegate: AuthServiceDelegate?
    
    var token: String? {
        VKSdk.accessToken().accessToken
    }
    
    var userId: String? {
        VKSdk.accessToken().userId
    }
    
    // MARK: - Initial
    override init() {
        vkSDK = VKSdk.initialize(withAppId: appID)
        super.init()
        vkSDK.register(self)
        vkSDK.uiDelegate = self
    }
    
    // MARK: - Methods
    func wakeUpSession() {
        let scope = ["offline",
                     "wall",
                     "friends",
                     "groups"]
        
        VKSdk.wakeUpSession(scope) { [delegate] (state, error) in
            switch state {
            case .authorized:
                delegate?.authServiceSignIn()
            case .initialized:
                VKSdk.authorize(scope)
            default:
                delegate?.authServiceSignInDidFail()
                fatalError(error?.localizedDescription ?? "No error description")
            }
        }
    }
    
    // MARK: - VKSdkDelegate
    
    func vkSdkAccessAuthorizationFinished(with result: VKAuthorizationResult!) {
        if result.token != nil {
            delegate?.authServiceSignIn()
        } else {
            print(result.error.localizedDescription)
        }
    }
    
    func vkSdkUserAuthorizationFailed() {
//        delegate?.authServiceSignInDidFail()
    }
    
    // MARK: - VKSdkUIDelegate
    
    func vkSdkShouldPresent(_ controller: UIViewController!) {
        delegate?.authServiceShouldShow(controller)
    }
    
    func vkSdkNeedCaptchaEnter(_ captchaError: VKError!) {
        
    }
    
}

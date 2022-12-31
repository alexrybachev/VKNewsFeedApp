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
    
    // MARK: - Initial
    override init() {
        vkSDK = VKSdk.initialize(withAppId: appID)
        super.init()
        print("VKSdk.initialize")
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
                print("wakeUpSession - authorized")
                delegate?.authServiceSignIn()
            case .initialized:
                print("wakeUpSession - initialized")
                VKSdk.authorize(scope)
            default:
                delegate?.authServiceSignInDidFail()
                fatalError(error?.localizedDescription ?? "No error description")
            }
        }
    }
    
    // MARK: - VKSdkDelegate
    
    func vkSdkAccessAuthorizationFinished(with result: VKAuthorizationResult!) {
        print(#function)
        if result.token != nil {
            delegate?.authServiceSignIn()
        } else {
            print(result.error.localizedDescription)
        }
    }
    
    func vkSdkUserAuthorizationFailed() {
        print(#function)
//        delegate?.authServiceSignInDidFail()
    }
    
    // MARK: - VKSdkUIDelegate
    
    func vkSdkShouldPresent(_ controller: UIViewController!) {
        print(#function)
        delegate?.authServiceShouldShow(controller)
    }
    
    func vkSdkNeedCaptchaEnter(_ captchaError: VKError!) {
        print(#function)
    }
    
}

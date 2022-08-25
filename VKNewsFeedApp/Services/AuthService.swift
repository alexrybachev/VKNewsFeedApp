//
//  AuthService.swift
//  VKNewsFeedApp
//
//  Created by Aleksandr Rybachev on 25.08.2022.
//

import Foundation
import VK_ios_sdk

class AuthService: NSObject, VKSdkDelegate, VKSdkUIDelegate {
    
    private let appID = "51410477"
    private let vkSDK: VKSdk
    
    override init() {
        vkSDK = VKSdk.initialize(withAppId: appID)
        super.init()
        print("VKSdk.initialize")
        vkSDK.register(self)
        vkSDK.uiDelegate = self
    }
    
    func vkSdkAccessAuthorizationFinished(with result: VKAuthorizationResult!) {
        print(#function)
    }
    
    func vkSdkUserAuthorizationFailed() {
        print(#function)
    }
    
    func vkSdkShouldPresent(_ controller: UIViewController!) {
        print(#function)
    }
    
    func vkSdkNeedCaptchaEnter(_ captchaError: VKError!) {
        print(#function)
    }
    
}

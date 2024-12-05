//
//  SceneDelegate.swift
//  WannaGoHome
//
//  Created by opfic on 12/5/24.
//

import RxKakaoSDKAuth
import KakaoSDKAuth
import UIKit

// MyappDelegate에서 SceneDelegate 클래스를 사용하도록 confiration 설정 필요
class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    //  handleOpenURL() 추가
    func scene(_ scene: UIScene, openURLContexts URLContexts: Set<UIOpenURLContext>) {
        if let url = URLContexts.first?.url {
            if (AuthApi.isKakaoTalkLoginUrl(url)) {
                _ = AuthController.rx.handleOpenUrl(url: url)
            }
        }
    }
}

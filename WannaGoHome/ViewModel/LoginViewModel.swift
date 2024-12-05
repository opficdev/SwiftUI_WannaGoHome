//
//  LoginViewModel.swift
//  WannaGoHome
//
//  Created by opfic on 12/5/24.
//

import Foundation
import RxSwift
import RxKakaoSDKAuth
import RxKakaoSDKUser
import KakaoSDKUser

class LoginViewModel: ObservableObject {
    
    let disposeBag = DisposeBag()
    
    //  카카오톡 로그인 시도
    @discardableResult
    func handleKakaoLogin() -> Bool {
        //  카카오톡 앱이 설치되어 있을 때
        var value = false
        if (UserApi.isKakaoTalkLoginAvailable()) {
            UserApi.shared.rx.loginWithKakaoTalk()
                .subscribe(onNext:{ (oauthToken) in
                    print("loginWithKakaoTalk() success.")
                    // 성공 시 동작 구현
                    value = true
                    _ = oauthToken
                    
                }, onError: {error in
                    print(error)
                })
            .disposed(by: disposeBag)
        }
        else {  //  카카오 웹뷰를 통해 로그인
            UserApi.shared.rx.loginWithKakaoAccount()
                .subscribe(onNext:{ (oauthToken) in
                    print("loginWithKakaoAccount() success.")
                    // 성공 시 동작 구현
                    value = true
                    _ = oauthToken
                }, onError: {error in
                    print(error)
                })
                .disposed(by: disposeBag)
        }
        return value
    }
    
    //  카카오톡 로그아웃 시도
    @discardableResult
    func handleKakaoLogout() -> Bool {
        var value = false
        UserApi.shared.rx.logout()
            .subscribe(onCompleted:{
                print("logout() success.")
                value = true
            }, onError: {error in
                print(error)
            })
            .disposed(by: disposeBag)
        return value
    }
}

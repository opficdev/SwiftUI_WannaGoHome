//
//  WannaGoHomeApp.swift
//  WannaGoHome
//
//  Created by opfic on 12/5/24.
//

import SwiftUI


@main

struct WannaGoHomeApp: App {
    @UIApplicationDelegateAdaptor var appDelegate: AppDelegate
    init() {
        UIView.appearance().overrideUserInterfaceStyle = .light
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

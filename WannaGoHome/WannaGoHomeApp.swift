//
//  WannaGoHomeApp.swift
//  WannaGoHome
//
//  Created by opfic on 12/5/24.
//

import SwiftUI

@main
struct WannaGoHomeApp: App {
    @StateObject private var ContentVM = ContentViewModel()
    init() {
        UIView.appearance().overrideUserInterfaceStyle = .light
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(ContentVM)
        }
    }
}

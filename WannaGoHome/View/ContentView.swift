//
//  ContentView.swift
//  WannaGoHome
//
//  Created by opfic on 12/5/24.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var ContentVM: ContentViewModel
    
    var body: some View {
        TabView(selection: $ContentVM.selectedTab) {
            DDayView()
                .tabItem {
                    Label("디데이", systemImage: "calendar.day.timeline.right")
                }
                .tag("DDayView")
        }
    }
}

#Preview {
    ContentView()
}

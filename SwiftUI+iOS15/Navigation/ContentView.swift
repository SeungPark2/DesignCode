//
//  ContentView.swift
//  SwiftUI+iOS15
//
//  Created by 박승태 on 2022/06/20.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("selectedTab") var selectedTab: Tab = .home
    @EnvironmentObject var model: Model
    
    var body: some View {
        ZStack(alignment: .bottom) {
            
            switch self.selectedTab {
            case .home: HomeView()
            case .explore : AccountView()
            case .notifications: AccountView()
            case .library: AccountView()
            }
                
            TabBar()
                .offset(y: self.model.showDetail ? 200 : 0)
        }
        .safeAreaInset(edge: .bottom, spacing: 0) {
            Color.clear.frame(height: 44)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
            .previewDevice("iPhone 12")
            .environmentObject(Model())
    }
}

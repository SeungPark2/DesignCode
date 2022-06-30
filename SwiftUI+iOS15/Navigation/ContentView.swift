//
//  ContentView.swift
//  SwiftUI+iOS15
//
//  Created by 박승태 on 2022/06/20.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("selectedTab") var selectedTab: Tab = .home
    
    var body: some View {
        ZStack(alignment: .bottom) {
            Group {
                switch self.selectedTab {
                    case .home: HomeView()
                    case .explore : AccountView()
                    case .notifications: AccountView()
                    case .library: AccountView()
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            TabBar()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
            .previewDevice("iPhone 12")
    }
}

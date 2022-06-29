//
//  TabBar.swift
//  SwiftUI+iOS15
//
//  Created by 박승태 on 2022/06/29.
//

import SwiftUI

struct TabBar: View {
    @State var selectedTab: Tab = .home

    var body: some View {
        ZStack(alignment: .bottom) {
            Group {
                switch self.selectedTab {
                    case .home: ContentView()
                    case .explore : AccountView()
                    case .notifications: AccountView()
                    case .library: AccountView()
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            HStack {
                Spacer()
                ForEach(tabItems) { item in
                    Button {
                        self.selectedTab = item.tab
                    } label: {
                        VStack(spacing: 0) {
                            Image(systemName: item.icon)
                                .symbolVariant(.fill)
                                .font(.body.bold())
                                .frame(width: 44, height: 29)
                            Text(item.text)
                                .font(.caption2)
                                .lineLimit(1)
                        }
                        .frame(maxWidth: .infinity)
                    }
                    .foregroundStyle(self.selectedTab == item.tab ? .primary : .secondary)
                }
            }
            .padding(.horizontal, 8)
            .padding(.top, 14)
            .frame(height: 88, alignment: .top)
            .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 34, style: .continuous))
            .strokeStyle(cornerRadius: 34)
            .frame(maxHeight: .infinity, alignment: .bottom)
            .ignoresSafeArea()
        }
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}

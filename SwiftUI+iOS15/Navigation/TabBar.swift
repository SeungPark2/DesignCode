//
//  TabBar.swift
//  SwiftUI+iOS15
//
//  Created by 박승태 on 2022/06/29.
//

import SwiftUI

struct TabBar: View {
    @AppStorage("selectedTab") var selectedTab: Tab = .home
    @State var color: Color = .teal
    @State var tabItemWidth: CGFloat = 0

    var body: some View {
        GeometryReader { proxy in
            let hasHomeIndicator: Bool = proxy.safeAreaInsets.bottom - 44 > 20
            
            HStack {
                self.buttons
            }
            .padding(.horizontal, 8)
            .padding(.top, 14)
            .frame(height: hasHomeIndicator ? 88 : 62, alignment: .top)
            .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: hasHomeIndicator ? 34 : 0, style: .continuous))
            .background(
                self.background
            )
            .overlay(
                self.overlay
            )
            .strokeStyle(cornerRadius: hasHomeIndicator ? 34 : 0)
            .frame(maxHeight: .infinity, alignment: .bottom)
            .ignoresSafeArea()
        }
    }
    
    var buttons: some View {
        ForEach(tabItems) { item in
            Button {
                withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
                    self.selectedTab = item.tab
                    self.color = item.color
                }
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
            .blendMode(self.selectedTab == item.tab ? .overlay : .normal)
            .overlay(
                GeometryReader { proxy in
                    Color.clear.preference(key: TabPreferenceKey.self, value: proxy.size.width)
                }
            )
            .onPreferenceChange(TabPreferenceKey.self) { value in
                self.tabItemWidth = value
            }
        }
    }
    
    var background: some View {
        HStack {
            if self.selectedTab == .library { Spacer() }
            if self.selectedTab == .explore { Spacer() }
            if self.selectedTab == .notifications {
                Spacer()
                Spacer()
            }
            Circle().fill(self.color).frame(width: self.tabItemWidth)
            if self.selectedTab == .home { Spacer() }
            if self.selectedTab == .explore {
                Spacer()
                Spacer()
            }
            if self.selectedTab == .notifications { Spacer() }
        }
        .padding(.horizontal, 8)
    }
    
    var overlay: some View {
        HStack {
            if self.selectedTab == .library { Spacer() }
            if self.selectedTab == .explore { Spacer() }
            if self.selectedTab == .notifications {
                Spacer()
                Spacer()
            }
            Rectangle()
                .fill(self.color)
                .frame(width: 28, height: 5)
                .cornerRadius(3)
                .frame(width: self.tabItemWidth)
                .frame(maxHeight: .infinity, alignment: .top)
            if self.selectedTab == .home { Spacer() }
            if self.selectedTab == .explore {
                Spacer()
                Spacer()
            }
            if self.selectedTab == .notifications { Spacer() }
        }
        .padding(.horizontal, 8)
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
            .previewInterfaceOrientation(.portrait)
    }
}

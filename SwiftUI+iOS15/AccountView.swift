//
//  AccountView.swift
//  SwiftUI+iOS15
//
//  Created by 박승태 on 2022/06/24.
//

import SwiftUI

struct AccountView: View {
    @State var isDeleted: Bool = false
    @State var isPinned: Bool = false
    
    var body: some View {
        NavigationView {
            List {
                self.profile
                
                self.menu
                
                self.links
            }
            .listStyle(.insetGrouped)
            .navigationTitle("Account")
        }
    }
    
    var profile: some View {
        VStack(spacing: 8) {
            Image(systemName: "person.crop.circle.fill.badge.checkmark")
                .symbolVariant(.circle.fill)
                .font(.system(size: 32))
                .symbolRenderingMode(.palette)
                .foregroundStyle(.blue, .blue.opacity(0.3))
                .padding()
                .background(Circle().fill(.ultraThinMaterial))
                .background(
                    HexagonView()
                        .offset(x: -50, y: -100)
                )
            Text("박승태")
                .font(.title.weight(.semibold))
            HStack {
                Image(systemName: "location")
                    .imageScale(.large)
                Text("부천")
                    .foregroundColor(.secondary)
            }
        }
        .frame(maxWidth: .infinity)
        .padding()
    }
    
    var menu: some View {
        Section {
            NavigationLink(destination: ContentView()) {
                Label("Settings", systemImage: "gear")
                    .accentColor(.primary)
            }
            NavigationLink { Text("Billing") } label: {
                Label("Billing", systemImage: "creditcard")
            }
            NavigationLink { ContentView()} label: {
                Label("Help", systemImage: "questionmark")
                    .imageScale(.small)
            }
        }
        .accentColor(.primary)
        .listRowSeparatorTint(.blue)
        .listRowSeparator(.hidden)
    }
    
    var links: some View {
        Section {
            if !self.isDeleted {
                Link(destination: URL(string: "https://www.apple.com")!) {
                    HStack {
                        Label("Apple", systemImage: "house")
                        Spacer()
                        Image(systemName: "link")
                            .foregroundColor(.secondary)
                    }
                }
                .swipeActions(edge: .leading,
                              allowsFullSwipe: false) {
                    Button(action: { self.isDeleted = true }) {
                        Label("Delete", systemImage: "trash")
                    }
                    .tint(.red)
                    self.pinButton
                }
            }
            Link(destination: URL(string: "https://www.naver.com")!) {
                HStack {
                    Label("Naver", systemImage: "tv")
                    Spacer()
                    Image(systemName: "link")
                        .foregroundColor(.secondary)
                }
            }
            .swipeActions {
                self.pinButton
            }
        }
        .accentColor(.primary)
    }
    
    var pinButton: some View {
        Button { self.isPinned.toggle() } label: {
            if self.isPinned {
                Label("Unpin", systemImage: "pin.slash")
            }
            else {
                Label("Pin", systemImage: "pin")
            }
        }
        .tint(self.isPinned ? .gray : .yellow)
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}

//
//  NavigationBar.swift
//  SwiftUI+iOS15
//
//  Created by 박승태 on 2022/07/04.
//

import SwiftUI

struct NavigationBar: View {
    var title: String = ""
    @Binding var hasScrolled: Bool
    @State var showSearch: Bool = false
    @State var showAccount: Bool = false
    @AppStorage("showModal") var showModal: Bool = false
    
    var body: some View {
        ZStack {
            Color.clear
                .background(.ultraThinMaterial)
                .blur(radius: 10)
                .opacity(self.hasScrolled ? 1 : 0)
            
            Text(self.title)
                .animatableFont(size: self.hasScrolled ? 22 : 34, weight: .bold)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 20)
                .padding(.top, 20)
                .offset(y: self.hasScrolled ? -4 : 0)
            
            HStack(spacing: 16) {
                Button {
                    self.showSearch = true
                } label: {
                    Image(systemName: "magnifyingglass")
                        .font(.body.weight(.bold))
                        .frame(width: 36, height: 36)
                        .foregroundStyle(.secondary)
                        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 14, style: .continuous))
                    .strokeStyle(cornerRadius: 14)
                }
                .sheet(isPresented: $showSearch) {
                    SearchView()
                }
                
                Button {
//                    self.showAccount = true
                    withAnimation {
                        self.showModal = true
                    }
                } label: {
                    Image("Avatar Default")
                        .resizable()
                        .frame(width: 26, height: 26)
                        .cornerRadius(10)
                        .padding(8)
                        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 18, style: .continuous))
                        .strokeStyle(cornerRadius: 18)
                }
                .sheet(isPresented: $showAccount) {
                    AccountView()
                }
            }
            .frame(maxWidth: .infinity, alignment: .trailing)
            .padding(.trailing, 20)
            .padding(.top, 20)
            .offset(y: self.hasScrolled ? -4 : 0)
        }
        .frame(height: self.hasScrolled ? 44 : 70)
        .frame(maxHeight: .infinity, alignment: .top)
    }
}

struct NavigationBar_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBar(title: "Featured", hasScrolled: .constant(false))
    }
}

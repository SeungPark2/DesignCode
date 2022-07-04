//
//  NavigationBar.swift
//  SwiftUI+iOS15
//
//  Created by 박승태 on 2022/07/04.
//

import SwiftUI

struct NavigationBar: View {
    var title: String = ""
    
    var body: some View {
        ZStack {
            Color.clear
                .background(.ultraThinMaterial)
                .blur(radius: 10)
            
            Text(self.title)
                .font(.largeTitle.weight(.bold))
                .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading, 20)
        }
        .frame(height: 70)
        .frame(maxHeight: .infinity, alignment: .top)
    }
}

struct NavigationBar_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBar(title: "Featured")
    }
}

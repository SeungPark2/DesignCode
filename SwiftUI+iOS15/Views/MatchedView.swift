//
//  MatchedView.swift
//  SwiftUI+iOS15
//
//  Created by 박승태 on 2022/07/07.
//

import SwiftUI

struct MatchedView: View {
    @Namespace var namespace
    @State var show: Bool = false
    
    var body: some View {
        ZStack {
            if !self.show {
                VStack(alignment: .leading, spacing: 12) {
                    Text("SwiftUI")
                        .font(.largeTitle.weight(.bold))
                        .matchedGeometryEffect(id: "title", in: self.namespace)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Text("20 sections - 3 hours".uppercased())
                        .font(.footnote.weight(.semibold))
                        .matchedGeometryEffect(id: "subtitle", in: self.namespace)
                    
                    Text("Build an iOS app for iOS 15 with custom layouts, animations and ...")
                        .font(.footnote)
                        .matchedGeometryEffect(id: "text", in: self.namespace)
                }
                .padding(20)
                .foregroundStyle(.white)
                .background(
                    Color.red.matchedGeometryEffect(id: "background", in: self.namespace)
                )
                .padding(20)
            }
            else {
                VStack(alignment: .leading, spacing: 12) {
                    Spacer()
                    Text("Build an iOS app for iOS 15 with custom layouts, animations and ...")
                        .font(.footnote)
                        .matchedGeometryEffect(id: "text", in: self.namespace)
                    
                    Text("20 sections - 3 hours".uppercased())
                        .font(.footnote.weight(.semibold))
                        .matchedGeometryEffect(id: "subtitle", in: self.namespace)

                    Text("SwiftUI")
                        .font(.largeTitle.weight(.bold))
                        .matchedGeometryEffect(id: "title", in: self.namespace)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                .padding(20)
                .foregroundStyle(.black)
                .background(
                    Color.blue.matchedGeometryEffect(id: "background", in: self.namespace)
                )
            }
        }
        .onTapGesture {
            withAnimation(.spring(response: 0.6, dampingFraction: 0.8)) {
                self.show.toggle()
            }
        }
    }
}

struct MatchedView_Previews: PreviewProvider {
    static var previews: some View {
        MatchedView()
    }
}

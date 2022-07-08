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
                    Spacer()
                    VStack {
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
                    .background(
                        Rectangle()
                            .fill(.ultraThinMaterial)
                            .mask(
                                RoundedRectangle(cornerRadius: 30, style: .continuous)
                            )
                            .blur(radius: 30)
                            .matchedGeometryEffect(id: "blur", in: self.namespace)
                    )
                }
                .foregroundStyle(.white)
                .background(
                    Image("Illustration 9")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .matchedGeometryEffect(id: "image", in: self.namespace)
                )
                .background(
                    Image("Background 5")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .matchedGeometryEffect(id: "background", in: self.namespace)
                )
                .mask(
                    RoundedRectangle(cornerRadius: 30, style: .continuous)
                        .matchedGeometryEffect(id: "mask", in: self.namespace)
                )
                .padding(20)
                
            }
            else {
                ScrollView {
                    VStack {
                        Spacer()
                    }
                    .frame(maxWidth: .infinity)
                    .frame(height: 500)
                    .padding(20)
                    .foregroundStyle(.black)
                    .background(
                        Image("Illustration 9")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .matchedGeometryEffect(id: "image", in: self.namespace)
                    )
                    .background(
                        Image("Background 5")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .matchedGeometryEffect(id: "background", in: self.namespace)
                    )
                    .mask(
                        RoundedRectangle(cornerRadius: 30, style: .continuous)
                            .matchedGeometryEffect(id: "mask", in: self.namespace)
                    )
                    .overlay(
                        VStack(alignment: .leading, spacing: 12) {
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
                            Divider()
                            HStack {
                                Image("Avatar Default")
                                    .resizable()
                                    .frame(width: 26, height: 26)
                                    .cornerRadius(10)
                                    .padding(8)
                                    .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 18, style: .continuous))
                                    .strokeStyle(cornerRadius: 18)
//                                Text("PST")
//                                    .font(.footnote)
                            }
                        }
                            .padding(20)
                            .background(
                                Rectangle()
                                    .fill(.ultraThinMaterial)
                                    .mask(
                                        RoundedRectangle(cornerRadius: 30, style: .continuous)
                                    )
                                    .matchedGeometryEffect(id: "blur", in: self.namespace)
                            )
                            .offset(y: 250)
                            .padding(20)
                    )
                }
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

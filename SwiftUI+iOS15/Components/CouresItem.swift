//
//  CouresItem.swift
//  SwiftUI+iOS15
//
//  Created by 박승태 on 2022/07/11.
//

import SwiftUI

struct CouresItem: View {
    var namespace: Namespace.ID
    @Binding var show: Bool
    
    var body: some View {
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
}

struct CouresItem_Previews: PreviewProvider {
    @Namespace static var namespace
    
    static var previews: some View {
        CouresItem(namespace: namespace, show: .constant(true))
    }
}

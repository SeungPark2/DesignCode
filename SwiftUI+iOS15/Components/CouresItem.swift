//
//  CouresItem.swift
//  SwiftUI+iOS15
//
//  Created by 박승태 on 2022/07/11.
//

import SwiftUI

struct CouresItem: View {
    var namespace: Namespace.ID
    var coures: Course = courses[0]
    @Binding var show: Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Spacer()
            VStack {
                Text(self.coures.title)
                    .font(.largeTitle.weight(.bold))
                    .matchedGeometryEffect(id: "title\(self.coures.id)", in: self.namespace)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Text(self.coures.subtitle.uppercased())
                    .font(.footnote.weight(.semibold))
                    .matchedGeometryEffect(id: "subtitle\(self.coures.id)", in: self.namespace)
                
                Text(self.coures.text)
                    .font(.footnote)
                    .matchedGeometryEffect(id: "text\(self.coures.id)", in: self.namespace)
            }
            .padding(20)
            .background(
                Rectangle()
                    .fill(.ultraThinMaterial)
                    .mask(
                        RoundedRectangle(cornerRadius: 30, style: .continuous)
                    )
                    .blur(radius: 30)
                    .matchedGeometryEffect(id: "blur\(self.coures.id)", in: self.namespace)
            )
        }
        .foregroundStyle(.white)
        .background(
            Image(self.coures.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(20)
                .matchedGeometryEffect(id: "image\(self.coures.id)", in: self.namespace)
        )
        .background(
            Image(self.coures.background)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .matchedGeometryEffect(id: "background\(self.coures.id)", in: self.namespace)
        )
        .mask(
            RoundedRectangle(cornerRadius: 30, style: .continuous)
                .matchedGeometryEffect(id: "mask\(self.coures.id)", in: self.namespace)
        )
        .frame(height: 300)
    }
}

struct CouresItem_Previews: PreviewProvider {
    @Namespace static var namespace
    
    static var previews: some View {
        CouresItem(namespace: self.namespace, show: .constant(true))
    }
}

//
//  FeaturedItem.swift
//  SwiftUI+iOS15
//
//  Created by 박승태 on 2022/07/04.
//

import SwiftUI

struct FeaturedItem: View {
    var course: Course
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8.0) {
            Spacer()
            Image(self.course.logo)
                .resizable(resizingMode: .stretch)
                .aspectRatio(contentMode: .fit)
                .frame(width: 26.0, height: 26.0)
                .cornerRadius(20.0)
                .padding(9)
                .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 20, style: .continuous))
                .strokeStyle(cornerRadius: 16)
            Text(self.course.title)
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(.linearGradient(colors: [.primary, .primary.opacity(0.5)], startPoint: .topLeading, endPoint: .bottomTrailing))
            Text(self.course.subtitle.uppercased())
                .font(.footnote)
                .fontWeight(.semibold)
                .foregroundStyle(.secondary)
            Text(self.course.text)
                .font(.footnote)
                .multilineTextAlignment(.leading)
                .lineLimit(2)
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundColor(.secondary)
        }
        .padding(.all, 20.0)
        .padding(.vertical, 20)
        .frame(height: 350.0)
        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 30, style: .continuous))
        .shadow(color: Color("Shadow").opacity(0.3),
                radius: 10, x: 0, y: 10)
        .strokeStyle()
        .padding(.horizontal, 20)
        .overlay(
            Image(self.course.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 230)
                .offset(x: 32, y: -80)
        )
    }
}

struct FeaturedItem_Previews: PreviewProvider {
    static var previews: some View {
        FeaturedItem(course: Course(title: "", subtitle: "", text: "", image: "", logo: ""))
    }
}

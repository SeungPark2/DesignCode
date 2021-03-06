//
//  Styles.swift
//  SwiftUI+iOS15
//
//  Created by 박승태 on 2022/06/23.
//

import SwiftUI

struct StrokeStyle: ViewModifier {
    var cornerRadius: CGFloat
    @Environment(\.colorScheme) var colorScheme
    func body(content: Content) -> some View {
        content.overlay(
            RoundedRectangle(cornerRadius: self.cornerRadius,style: .continuous)
                .stroke(
                    .linearGradient(
                        colors: [
                            .white.opacity(self.colorScheme == .dark ? 0.1 : 0.3),
                            .black.opacity(self.colorScheme == .dark ? 0.3 : 0.1)
                        ], startPoint: .top, endPoint: .bottom
                    )
                )
                .blendMode(.overlay)
        )
    }
}

extension View {
    func strokeStyle(cornerRadius: CGFloat = 30) -> some View {
        modifier(StrokeStyle(cornerRadius: cornerRadius))
    }
}

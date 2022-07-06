//
//  AnimatableFontModifier.swift
//  SwiftUI+iOS15
//
//  Created by 박승태 on 2022/07/06.
//

import SwiftUI

struct AnimatableFontModifier: AnimatableModifier {
    var size: Double
    var weight: Font.Weight = .regular
    var design: Font.Design = .default
    
    var animatableData: Double {
        get { self.size }
        set { self.size = newValue }
    }
    
    func body(content: Content) -> some View {
        content
            .font(
                .system(
                    size: self.size,
                    weight: self.weight,
                    design: self.design
                )
            )
    }
}

extension View {
    func animatableFont(size: Double, weight: Font.Weight = .regular, design: Font.Design = .default) -> some View {
        self.modifier(AnimatableFontModifier(size: size, weight: weight, design: design))
    }
}

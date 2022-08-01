//
//  AngularButtonStyle.swift
//  SwiftUI+iOS15
//
//  Created by 박승태 on 2022/08/01.
//

import SwiftUI

struct AngularButtonStyle: ButtonStyle {
    @Environment(\.controlSize) var controlSize
    
    var extraPadding: CGFloat {
        switch self.controlSize {
        case .mini:    return 0
        case .small:   return 0
        case .regular: return 4
        case .large:   return 12
        default:       return 0
        }
    }
    
    var cornerRadius: CGFloat {
        switch self.controlSize {
        case .mini:     return 12
        case .small:    return 12
        case .regular:  return 16
        case .large:    return 20
        default:        return 12
        }
    }
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(.horizontal, 20 + self.extraPadding)
            .padding(.vertical, 4 + self.extraPadding)
            .background(
                RoundedRectangle(cornerRadius: self.cornerRadius, style: .continuous)
                    .fill(.linearGradient(colors: [Color(.systemBackground), Color(.systemBackground).opacity(0.6)], startPoint: .top, endPoint: .bottom))
                    .blendMode(.softLight)
            )
            .background(
                RoundedRectangle(cornerRadius: self.cornerRadius, style: .continuous)
                    .fill(.angularGradient(colors: [.pink, .purple, .blue, .pink], center: .center, startAngle: .degrees(-90), endAngle: .degrees(270)))
                    .blur(radius: self.cornerRadius)
            )
            .cornerRadius(self.cornerRadius)
    }
}

extension ButtonStyle where Self == AngularButtonStyle {
    static var angular: Self {
        return .init()
    }
}

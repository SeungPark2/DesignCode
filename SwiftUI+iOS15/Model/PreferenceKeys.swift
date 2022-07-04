//
//  PreferenceKeys.swift
//  SwiftUI+iOS15
//
//  Created by 박승태 on 2022/07/04.
//

import SwiftUI

struct ScrollPreferenceKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}

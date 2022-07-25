//
//  Suggestion.swift
//  SwiftUI+iOS15
//
//  Created by 박승태 on 2022/07/25.
//

import SwiftUI

struct Suggestion: Identifiable {
    let id = UUID()
    var text: String
}

var suggestions = [
    Suggestion(text: "SwiftUI"),
    Suggestion(text: "React"),
    Suggestion(text: "Design")
]

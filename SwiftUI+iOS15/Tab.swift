//
//  Tab.swift
//  SwiftUI+iOS15
//
//  Created by 박승태 on 2022/06/29.
//

import SwiftUI

struct TabItem: Identifiable {
    var id = UUID()
    var text: String
    var icon: String
}

var tabItems: [TabItem] = [
    TabItem(text: "Learn Now", icon: "house"),
    TabItem(text: "Explore", icon: "magnifyingglass"),
    TabItem(text: "Notifications", icon: "bell"),
    TabItem(text: "Library", icon: "rectangle.stack")
]

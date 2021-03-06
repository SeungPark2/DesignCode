//
//  SwiftUI_iOS15App.swift
//  SwiftUI+iOS15
//
//  Created by 박승태 on 2022/06/20.
//

import SwiftUI

@main
struct SwiftUI_iOS15App: App {
    @StateObject var model = Model()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(self.model)
        }
    }
}

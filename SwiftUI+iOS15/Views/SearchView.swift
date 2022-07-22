//
//  SearchView.swift
//  SwiftUI+iOS15
//
//  Created by 박승태 on 2022/07/22.
//

import SwiftUI

struct SearchView: View {
    @State var searchText: String = ""
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            List {
                ForEach(courses.filter{ $0.title.contains(self.searchText) ||
                                        self.searchText.isEmpty }) { item in
                    Text(item.title)
                }
            }
        }
        .searchable(text: $searchText,
                    placement: .navigationBarDrawer(displayMode: .always),
                     prompt: Text("SwiftUI, React, UI Design"))
        .navigationTitle("Search")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarItems(trailing: Button { self.presentationMode.wrappedValue.dismiss() } label: { Text("Done") })
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}

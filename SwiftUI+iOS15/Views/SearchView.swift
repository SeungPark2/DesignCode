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
            ScrollView {
                VStack {
                    self.content
                }
                .padding(20)
                .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 30, style: .continuous))
                .strokeStyle(cornerRadius: 30)
                .padding(20)
                .background(
                    Rectangle()
                        .fill(.regularMaterial)
                        .frame(height: 200)
                        .frame(maxHeight: .infinity, alignment: .top)
                        .blur(radius: 20)
                        .offset(y: -200)
                )
                .background(
                    Image("Blob 1").offset(x: -100, y: -200)
                )
            }
        }
        .searchable(text: $searchText,
                    placement: .navigationBarDrawer(displayMode: .always),
                    prompt: Text("SwiftUI, React, UI Design")) {
            ForEach(suggestions) { suggestion in
                Button {
                    self.searchText = suggestion.text
                } label: {
                    Text(suggestion.text)
                        .searchCompletion(suggestion.text)
                }
            }
        }
        .navigationTitle("Search")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarItems(trailing: Button { self.presentationMode.wrappedValue.dismiss() } label: { Text("Done") })
    }
    
    var content: some View {
        ForEach(courses.filter{ $0.title.contains(self.searchText) || self.searchText.isEmpty }) { item in
            HStack(alignment: .top, spacing: 12) {
                Image(item.image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 44, height: 44)
                    .background(Color("Background"))
                    .mask(Circle())
                VStack(alignment: .leading, spacing: 4) {
                    Text(item.title).bold()
                    Text(item.text)
                        .font(.footnote)
                        .foregroundColor(.secondary)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .multilineTextAlignment(.leadigng)
                }
            }
            .padding(.vertical, 4)
            .listRowSeparator(.hidden)
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}

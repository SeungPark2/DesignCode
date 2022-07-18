//
//  HomeView.swift
//  SwiftUI+iOS15
//
//  Created by 박승태 on 2022/06/30.
//

import SwiftUI

struct HomeView: View {
    @State var hasScrolled: Bool = false
    @Namespace var namespace
    @State var show: Bool = false
    @State var showStatusBar: Bool = false
    @State var selectedID: UUID = UUID()
    
    var body: some View {
        ZStack {
            Color("Background").ignoresSafeArea()
            
            ScrollView {
                self.scrollDetection
                
                self.featured
                
                Text("course".uppercased())
                    .font(.footnote.weight(.bold))
                    .foregroundColor(.secondary)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 20)
                
                if !self.show {
                    self.cards
                }
                else {
                    ForEach(courses) { course in
                        Rectangle()
                            .fill(.white)
                            .frame(height: 300)
                            .cornerRadius(30)
                            .shadow(color: Color("shadow"), radius: 20, x: 0, y: 10)
                            .opacity(0.3)
                        .padding(.horizontal, 30)
                    }
                }
            }
            .coordinateSpace(name: "scroll")
            .safeAreaInset(edge: .top, content: {
                Color.clear.frame(height: 70)
            })
            .overlay(
                NavigationBar(title: "Featured", hasScrolled: $hasScrolled)
            )
             
            if self.show {
                self.detail
            }
        }
        .statusBar(hidden: !self.showStatusBar)
        .onChange(of: self.show) { newValue in
            withAnimation(.closeCard) {
                self.showStatusBar = !newValue
            }
        }
    }
    
    var scrollDetection: some View {
        GeometryReader { proxy in
            Color.clear.preference(key: ScrollPreferenceKey.self, value: proxy.frame(in: .named("scroll")).minY)
        }
        .frame(height: 0)
        .onPreferenceChange(ScrollPreferenceKey.self, perform: { value in
            withAnimation(.easeInOut) {
                if value < 0 {
                    self.hasScrolled = true
                }
                else {
                    self.hasScrolled = false
                }
            }
        })
    }
    
    var featured: some View {
        TabView {
            ForEach(featuredCourses) { course in
                GeometryReader { proxy in
                    let minX = proxy.frame(in: .global).minX
                    
                    FeaturedItem(course: course)
                        .padding(.vertical, 40)
                        .rotation3DEffect(.degrees(minX / -10), axis: (x: 0, y: 1, z: 0))
                        .shadow(color: Color("Shadow").opacity(0.3),
                                radius: 10, x: 0, y: 10)
                        .blur(radius: abs(minX / 40))
                        .overlay(
                            Image(course.image)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(height: 230)
                                .offset(x: 32, y: -80)
                                .offset(x: minX / 2)
                        )
                }
            }
        }
        .tabViewStyle(.page(indexDisplayMode: .never))
        .frame(height: 430)
        .background(
            Image("Blob 1")
                .offset(x: 250, y: -100)
        )
    }
    
    var cards: some View {
        ForEach(courses) { cource in
            CouresItem(namespace: self.namespace,
                       coures: cource,
                       show: $show)
                .onTapGesture {
                    withAnimation(.openCard) {
                        self.show.toggle()
                        self.showStatusBar = false
                        self.selectedID = cource.id
                    }
            }
        }
    }
    
    var detail: some View {
        ForEach(courses) { course in
            if course.id == self.selectedID {
                CourseView(namespace: self.namespace, course: course, show: $show)
                    .zIndex(1)
                .transition(.asymmetric(insertion: .opacity.animation(.easeInOut(duration: 0.1)), removal: .opacity.animation(.easeInOut(duration: 0.3).delay(0.2)))
                )
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .preferredColorScheme(.dark)
    }
}

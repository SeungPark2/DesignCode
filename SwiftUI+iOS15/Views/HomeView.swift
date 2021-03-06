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
    @State var showCourse: Bool = false
    @State var selectedIndex: Int = 0
    @EnvironmentObject var model: Model
    
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
                
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 300), spacing: 20)], spacing: 20) {
                    if !self.show {
                        self.cards
                    }
                    else {
                        ForEach(courses) { course in
                            Rectangle()
                                .fill(.white)
                                .frame(height: 300)
                                .cornerRadius(30)
                                .shadow(color: Color("Shadow"), radius: 20, x: 0, y: 10)
                                .opacity(0.3)
                            .padding(.horizontal, 30)
                        }
                    }
                }
                .padding(.horizontal, 20)
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
            ForEach(Array(featuredCourses.enumerated()), id: \.offset) { index, course in
                GeometryReader { proxy in
                    let minX = proxy.frame(in: .global).minX
                    
                    FeaturedItem(course: course)
                        .frame(maxWidth: 500)
                        .frame(maxWidth: .infinity)
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
                        .onTapGesture {
                            self.showCourse = true
                            self.selectedIndex = index
                        }
                }
            }
        }
        .tabViewStyle(.page(indexDisplayMode: .never))
        .frame(height: 430)
        .background(
            Image("Blob 1")
                .offset(x: 250, y: -100)
        )
        .sheet(isPresented: $showCourse) {
            CourseView(namespace: self.namespace,
                       course: featuredCourses[self.selectedIndex],
                       show: $showCourse)
        }
    }
    
    var cards: some View {
        ForEach(courses) { cource in
            CouresItem(namespace: self.namespace,
                       coures: cource,
                       show: $show)
                .onTapGesture {
                    withAnimation(.openCard) {
                        self.show.toggle()
                        self.model.showDetail.toggle()
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
//            .environmentObject(Model())
    }
}

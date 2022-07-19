//
//  CourseView.swift
//  SwiftUI+iOS15
//
//  Created by 박승태 on 2022/07/11.
//

import SwiftUI

struct CourseView: View {
    var namespace: Namespace.ID
    var course: Course = courses[0]
    @Binding var show: Bool
    @State private var appear = [false, false, false]
    @EnvironmentObject var model: Model
    @State var viewState: CGSize = .zero
    @State var isDraggable: Bool = true
    
    var body: some View {
        ZStack {
            ScrollView {
                self.cover
                
                self.content
                    .offset(y: 120)
                    .padding(.bottom, 200)
                    .opacity(self.appear[2] ? 1 : 0)
            }
            .background(Color("Background \(self.course.id)"))
            .mask(RoundedRectangle(cornerRadius: self.viewState.width / 3, style: .continuous))
            .shadow(color: .black.opacity(0.3), radius: 30, x: 0, y: 10)
            .scaleEffect(self.viewState.width / -500 + 1)
            .background(.black.opacity(self.viewState.width / 500))
            .background(.ultraThinMaterial)
            .gesture(self.isDraggable ? self.drag : nil)
            .ignoresSafeArea()
            
            self.button
        }
        .onAppear {
            self.fadeIn()
        }
        .onChange(of: self.show) { newValue in
            self.fadeOut()
        }
    }
    
    var overlayContent: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(self.course.text)
                .font(.footnote)
                .matchedGeometryEffect(id: "text\(self.course.id)", in: self.namespace)
            
            Text(self.course.subtitle.uppercased())
                .font(.footnote.weight(.semibold))
                .matchedGeometryEffect(id: "subtitle\(self.course.id)", in: self.namespace)
            
            Text(self.course.title)
                .font(.largeTitle.weight(.bold))
                .matchedGeometryEffect(id: "title\(self.course.id)", in: self.namespace)
                .frame(maxWidth: .infinity, alignment: .leading)
            Divider()
                .opacity(self.appear[0] ? 1 : 0)
            HStack {
                Image("Avatar Default")
                    .resizable()
                    .frame(width: 26, height: 26)
                    .cornerRadius(10)
                    .padding(8)
                    .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 18, style: .continuous))
                    .strokeStyle(cornerRadius: 18)

                Text("PST")
                    .font(.footnote)
            }
            .opacity(self.appear[1] ? 1 : 0)
        }
            .padding(20)
            .background(
                Rectangle()
                    .fill(.ultraThinMaterial)
                    .mask(
                        RoundedRectangle(cornerRadius: 30, style: .continuous)
                    )
                    .matchedGeometryEffect(id: "blur\(self.course.id)", in: self.namespace)
            )
            .offset(y: 250)
            .padding(20)
    }
    
    private func fadeIn() {
        withAnimation(.easeInOut.delay(0.3)) {
            self.appear[0] = true
        }
        withAnimation(.easeInOut.delay(0.4)) {
            self.appear[1] = true
        }
        withAnimation(.easeInOut.delay(0.5)) {
            self.appear[2] = true
        }
    }
    
    private var drag: some Gesture {
        DragGesture(minimumDistance: 30, coordinateSpace: .local)
            .onChanged { value in
                guard value.translation.width > 0 else { return }
                
                if value.startLocation.x < 100 {
                    withAnimation(.closeCard) {
                        self.viewState = value.translation
                    }
                }
                
                if self.viewState.width > 120 {
                    self.close()
                }
            }
            .onEnded { value in
                if self.viewState.width > 80 {
                    self.close()
                    return
                }
                
                withAnimation(.closeCard) {
                    self.viewState = .zero
                }
            }
    }
    
    private func fadeOut() {
        self.appear[0] = false
        self.appear[1] = false
        self.appear[2] = false
    }
    
    private func close() {
        withAnimation(.closeCard.delay(0.3)) {
            self.show.toggle()
            self.model.showDetail.toggle()
        }
        
        withAnimation(.closeCard) {
            self.viewState = .zero
        }
        
        self.isDraggable = false
    }
    
    private var cover: some View {
        GeometryReader { proxy in
            let scrollY = proxy.frame(in: .global).minY
            
            VStack {
                Spacer()
            }
            .frame(maxWidth: .infinity)
            .frame(height: scrollY > 0 ? 500 + scrollY : 500)
            .foregroundStyle(.black)
            .background(
                Image(self.course.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .matchedGeometryEffect(id: "image\(self.course.id)", in: self.namespace)
                    .offset(y: scrollY > 0 ? scrollY * -0.8 : 0)
            )
            .background(
                Image(self.course.background)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .matchedGeometryEffect(id: "background\(self.course.id)", in: self.namespace)
                    .offset(y: scrollY > 0 ? -scrollY : 0)
                    .scaleEffect(scrollY > 0 ? scrollY / 1000 + 1 : 1)
                    .blur(radius: scrollY / 10)
            )
            .mask(
                RoundedRectangle(cornerRadius: 30, style: .continuous)
                    .matchedGeometryEffect(id: "mask\(self.course.id)", in: self.namespace)
                    .offset(y: scrollY > 0 ? -scrollY : 0)
            )
            .overlay(
                self.overlayContent
                    .offset(y:scrollY > 0 ? scrollY * -0.6 : 0)
            )
        }
        .frame(height: 500)
    }
    
    private var content: some View {
        VStack(alignment: .leading, spacing: 30) {
            Text("SwiftUI is hands-down the best way for designers to take a first step into code. ")
                .font(.title3).fontWeight(.medium)
            Text("This course")
                .font(.title).bold()
            Text("This course is unlike any other. We care about design and want to make sure that you get better at it in the process. It was written for designers and developers who are passionate about collaborating and building real apps for iOS and macOS. While it's not one codebase for all apps, you learn once and can apply the techniques and controls to all platforms with incredible quality, consistency and performance. It's beginner-friendly, but it's also packed with design tricks and efficient workflows for building great user interfaces and interactions.")
            Text("This year, SwiftUI got major upgrades from the WWDC 2020. The big news is that thanks to Apple Silicon, Macs will be able to run iOS and iPad apps soon. SwiftUI is the only framework that allows you to build apps for all of Apple's five platforms: iOS, iPadOS, macOS, tvOS and watchOS with the same codebase. New features like the Sidebar, Lazy Grid, Matched Geometry Effect and Xcode 12's visual editing tools will make it easier than ever to build for multiple platforms.")
            Text("Multiplatform app")
                .font(.title).bold()
            Text("For the first time, you can build entire apps using SwiftUI only. In Xcode 12, you can now create multi-platform apps with minimal code changes. SwiftUI will automatically translate the navigation, fonts, forms and controls to its respective platform. For example, a sidebar will look differently on the Mac versus the iPad, while using exactly the same code. Dynamic type will adjust for the appropriate platform language, readability and information density. ")
        }
        .padding(20)
    }
    
    private var button: some View {
        Button {
            withAnimation(.closeCard) {
                self.show.toggle()
                self.model.showDetail.toggle()
            }
        } label: {
            Image(systemName: "xmark")
                .font(.body.weight(.bold))
                .foregroundColor(.secondary)
                .padding(8)
                .background(.ultraThinMaterial, in: Circle())
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
        .padding(20)
        .ignoresSafeArea()
    }
}

struct CourseView_Previews: PreviewProvider {
    @Namespace static var namespace
    
    static var previews: some View {
        CourseView(namespace: namespace,
                   show: .constant(true))
        .environmentObject(Model())
    }
}

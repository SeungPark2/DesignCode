//
//  MatchedView.swift
//  SwiftUI+iOS15
//
//  Created by 박승태 on 2022/07/07.
//

import SwiftUI

struct MatchedView: View {
    @Namespace var namespace
    @State var show: Bool = false
    
    var body: some View {
        ZStack {
            if !self.show {
               
                
            }
            else {
                
            }
        }
        .onTapGesture {
            withAnimation(.spring(response: 0.6, dampingFraction: 0.8)) {
                self.show.toggle()
            }
        }
    }
}

struct MatchedView_Previews: PreviewProvider {
    static var previews: some View {
        MatchedView()
    }
}

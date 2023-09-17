//
//  ConditionalBootcamp.swift
//  SwiftfulThinkingBottcamp
//
//  Created by Jason on 2023/9/3.
//

import SwiftUI

struct ConditionalBootcamp: View {
    
    @State var showCircle: Bool = false
    @State var showRectangle: Bool = false
    @State var loading: Bool = false
    
    var body: some View {
        VStack{
            Button("Circle Button: \(showCircle.description)") {
                self.showCircle.toggle()
            }
            Button("RectTangle Button: \(showRectangle.description)") {
                self.showRectangle.toggle()
            }
            Button("Loading Button: \(loading.description)") {
                self.loading.toggle()
            }
            if self.showCircle {
                Circle()
                    .frame(width: 100, height: 100)
            }
            
            if self.showRectangle {
                Rectangle()
                    .frame(width: 100, height: 100)
            }
            
            if self.loading{
                ProgressView()
            }
            Spacer()
        }
    }
}

#Preview {
    ConditionalBootcamp()
}

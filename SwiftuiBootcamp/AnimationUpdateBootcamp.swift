//
//  AnimationUpdateBootcamp.swift
//  SwiftfulThinkingBottcamp
//
//  Created by Jason on 2023/9/17.
//

import SwiftUI

struct AnimationUpdateBootcamp: View {
    
    @State private var animate1: Bool = false
    @State private var animate2: Bool = false
    
    var body: some View {
        ZStack {
            VStack(spacing: 40){
                Button("Action1"){
                    animate1.toggle()
                }
                Button("Action2"){
                    animate2.toggle()
                }
                ZStack{
                    Rectangle()
                        .frame(width: 100, height: 100)
                        .frame(maxWidth: .infinity, alignment: animate1 ? .leading : .trailing)
                        .background(.orange)
                        .frame(maxHeight: .infinity, alignment:  animate2 ? .top : .bottom)
                        .background(.blue)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(.red)
            }
        }
        .animation(.spring(), value: animate1)
        .animation(.linear(duration: 5), value: animate2)
    }
}

#Preview {
    AnimationUpdateBootcamp()
}

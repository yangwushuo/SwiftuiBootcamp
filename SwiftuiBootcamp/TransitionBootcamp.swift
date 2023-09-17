//
//  TransitionBootcamp.swift
//  SwiftfulThinkingBottcamp
//
//  Created by Jason on 2023/9/3.
//

import SwiftUI

struct TransitionBootcamp: View {
    
    @State var showView: Bool = false
    
    var body: some View {
        ZStack(alignment: .bottom) {
            VStack{
                Button("Button"){
                    self.showView.toggle()
                }
                Spacer()
            }
            if self.showView {
                RoundedRectangle(cornerRadius: 30)
                    .frame(height: UIScreen.main.bounds.height * 0.5)
//                    .transition(.move(edge: .bottom)) // 从底部弹出
                    .transition(.asymmetric(insertion: .move(edge: .bottom), removal: .opacity.animation(.easeInOut))) // 定义怎么进入 怎么离开
                    .animation(/*@START_MENU_TOKEN@*/.easeIn/*@END_MENU_TOKEN@*/)
            }
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}

#Preview {
    TransitionBootcamp()
}

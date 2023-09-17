//
//  AnimationBootcamp.swift
//  SwiftfulThinkingBottcamp
//
//  Created by Jason on 2023/9/3.
//

import SwiftUI

struct AnimationBootcamp: View {
    
    @State var isAnimated: Bool = false
    
    var body: some View {
        Button("Button"){
            // 设置动画所有与 @state有关的元素都会伴随动画
            withAnimation(.easeInOut) {
                self.isAnimated.toggle()
            }
        }
        Spacer()
        RoundedRectangle(cornerRadius: isAnimated ? 50 : 25)
            .fill(isAnimated ? Color.red : Color.orange)
            .frame(
                width: isAnimated ? 100 : 300,
                height: isAnimated ? 100 : 300
            )
            .rotationEffect(Angle(degrees: isAnimated ? 360 : 0))
            .offset(y: isAnimated ? 300 : 0)
        Spacer()
    }
}

#Preview {
    AnimationBootcamp()
}

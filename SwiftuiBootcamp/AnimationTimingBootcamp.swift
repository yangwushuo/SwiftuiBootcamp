//
//  AnimationTimingBootcamp.swift
//  SwiftfulThinkingBottcamp
//
//  Created by Jason on 2023/9/3.
//

import SwiftUI

struct AnimationTimingBootcamp: View {
    
    @State var isAnimating: Bool = false
    let timing: Double = 10.0
    
    var body: some View {
        VStack {
            Button("Button"){
                self.isAnimating.toggle()
            }
            RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                .frame(width: isAnimating ? 350 : 50, height: 100)
                .animation(.linear(duration: timing))
            RoundedRectangle(cornerRadius: 25.0)
                .frame(width: isAnimating ? 350 : 50, height: 100)
                .animation(.easeIn(duration: timing))
            RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                .frame(width: isAnimating ? 350 : 50, height: 100)
                .animation(.easeOut(duration: timing))
            RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                .frame(width: isAnimating ? 350 : 50, height: 100)
                .animation(.easeInOut(duration: timing))
            RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                .frame(width: isAnimating ? 350 : 50, height: 100)
                .animation(.spring())
            RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                .frame(width: isAnimating ? 350 : 50, height: 100)
                .animation(.spring(response: 0.5, dampingFraction: 0.7, blendDuration: 1))
//            response：这个参数表示动画的响应时间，也称为动画的起始速度。它是一个时间值，通常以秒为单位。在动画开始时，视图会以较快的速度启动。较小的 response 值会导致更快的启动速度。
//            dampingFraction：这个参数表示动画的阻尼系数。阻尼系数控制动画在停止之前的震荡情况。值范围通常在 0 到 1 之间。较小的值会导致较多的震荡，而较大的值会导致更快地停止。
//            blendDuration：这个参数表示混合时间，也称为动画的结束速度。它是一个时间值，通常以秒为单位。在动画接近完成时，它会以较慢的速度减速。较小的 blendDuration 值会导致更快的减速。
        }
    }
}

#Preview {
    AnimationTimingBootcamp()
}

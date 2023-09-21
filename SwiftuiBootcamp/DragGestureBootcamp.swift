//
//  DragGestureBootcamp.swift
//  SwiftuiBootcamp
//
//  Created by staircaseprogram on 2023/9/21.
//

import SwiftUI

struct DragGestureBootcamp: View {
    
    @State var offset: CGSize = .zero
    
    var body: some View {
        ZStack {
            VStack {
                Text("\(offset.width)")
                Spacer()
            }
            
            RoundedRectangle(cornerRadius: 50)
                .fill(Color.orange)
                .frame(width: 300, height: 500)
                .overlay(content: {
                    Image(systemName: "circle.square")
                        .resizable()
                        .frame(width: 100, height: 100)
                        .foregroundStyle(Color.white)
                })
                .offset(offset)
                .scaleEffect(getScaleAmount())
                .rotationEffect(Angle(degrees: getRotationAmount()))
                .gesture(
                    DragGesture()
                        .onChanged{ value in
                            withAnimation(.spring()) {
                                offset = value.translation
                            }
                        }
                        .onEnded{ value in
                            withAnimation {
                                offset = .zero
                            }
                        }
                )
        }
    }
    
    // 缩小
    func getScaleAmount() -> CGFloat {
        // 屏幕宽度/2
        let max = UIScreen.main.bounds.width / 2
        // 获取当前横向偏移量绝对值
        let currentAmout = abs(offset.width)
        // 获取比例
        let percentage = currentAmout / max
        // 限制最小比例0.5 再缩放百分之50
        return 1.0 - min(percentage, 0.5) * 0.5
    }
    
    
    // 角度
    func getRotationAmount() -> Double {
        let max = UIScreen.main.bounds.width / 2
        let currentAmount = offset.width
        let percentage = currentAmount / max
        let percentageAsDouble = Double(percentage)
        // 最大角度
        let maxAngle: Double = 30
        return percentageAsDouble * maxAngle
    }
}

#Preview {
    DragGestureBootcamp()
}

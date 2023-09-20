//
//  MagnificationGestureBootcamp.swift
//  SwiftuiBootcamp
//
//  Created by Jason on 2023/9/20.
//

import SwiftUI

struct MagnificationGestureBootcamp: View {
    
    @State var currentAmount: CGFloat = 0
    @State var lastAmount: CGFloat = 0
    
    var body: some View {
        VStack(spacing: 10){
            HStack {
                Circle()
                    .frame(width: 35, height: 35)
                Text("Swiftful Thinking")
                Spacer()
                Image(systemName: "ellipsis")
            }
            .padding(.horizontal)
            Image("tatumu")
                .frame(height: 300)
                .scaleEffect(1 + currentAmount)
                .gesture(
                    // 拖动手势
                    MagnificationGesture()
                        .onChanged{ value in // 拖动手势开始 value 当前放大系数
                            currentAmount = value - 1 // 在原有的基础上获取当前放大了多少系数
                        }
                        .onEnded{ value in // 拖动手势结束
                            withAnimation(.spring(duration: 0.4)){
                                currentAmount = 0 // 复原放大缩小效果
                            }
                        }
                )
            HStack {
                Image(systemName: "heart.fill")
                Image(systemName: "text.bubble.fill")
                Spacer()
            }
            .padding(.horizontal)
            .font(.headline)
            Text("This is the caption for my photo!")
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
        }
    }
}

#Preview {
    MagnificationGestureBootcamp()
}

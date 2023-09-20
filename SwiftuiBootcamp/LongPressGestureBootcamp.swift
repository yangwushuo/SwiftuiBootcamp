//
//  LongPressGestureBootcamp.swift
//  SwiftuiBootcamp
//
//  Created by Jason on 2023/9/20.
//

import SwiftUI

struct LongPressGestureBootcamp: View {
    
    @State var isComplete: Bool = false
    @State var isSuccess: Bool = false
    
    var body: some View {
        VStack{
            Rectangle()
                .fill(isSuccess ? Color.green : Color.blue)
                .frame(maxWidth: isComplete ? .infinity : 0)
                .frame(height: 55)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color.gray)
                .cornerRadius(20)
                .padding(.horizontal)
                
            
            HStack {
                Text("CLICK HERE")
                    .foregroundStyle(Color.white)
                    .padding()
                    .background(Color.black)
                    .cornerRadius(10)
                    // minimumDuration 一秒钟后触发 maximunDistance最大手指允许移动距离
                    .onLongPressGesture(minimumDuration: 1.0, maximumDistance: 50) { (isPressing) in
                        // start of press -> min duration
                        // 触碰开始
                        if isPressing {
                            withAnimation(.easeInOut(duration: 1.0)) {
                                isComplete = true
                            }
                        }else {
                            // 触碰结束
//                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
//                                if !isSuccess {
//                                    withAnimation {
//                                        isComplete = false
//                                    }
//                                }
//                            }
                            if !isSuccess {
                                withAnimation {
                                    isComplete = false
                                }
                            }
                        }
                    } perform: {
                        // 长按v g f c f v达到一秒最小时间触发
                        withAnimation {
                            isSuccess = true
                        }
                    }
                
                Text("RESET")
                    .foregroundStyle(Color.white)
                    .padding()
                    .background(Color.black)
                    .cornerRadius(10)
                    .onTapGesture {
                        isComplete = false
                        isSuccess = false
                    }
            }
        }
    }
}

#Preview {
    LongPressGestureBootcamp()
}

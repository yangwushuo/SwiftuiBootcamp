//
//  DragGestureBootcamp2.swift
//  SwiftuiBootcamp
//
//  Created by staircaseprogram on 2023/9/21.
//

import SwiftUI

struct DragGestureBootcamp2: View {
    
    // 默认偏移量
    @State var startingOffsetY: CGFloat = UIScreen.main.bounds.height * 0.85
    // 当亲偏移量
    @State var currentDragOffsetY: CGFloat = 0
    // 最后偏移量
    @State var endingOffsetY: CGFloat = 0
    
    var body: some View {
        ZStack {
            Color.green.ignoresSafeArea()
            VStack{
                Text("currentDragOffsetY\(currentDragOffsetY)")
                Text("endingOffsetY\(endingOffsetY)")
            }
            
            MySignUpView()
                .offset(y: startingOffsetY)
                .offset(y: currentDragOffsetY)
                .offset(y: endingOffsetY)
                .gesture(
                    DragGesture()
                        .onChanged { value in
                            withAnimation(.spring()) {
                                currentDragOffsetY = value.translation.height
                            }
                        }
                        .onEnded { value in
                            withAnimation(.spring()) {
                                // 往上
                                if currentDragOffsetY < -150 {
                                    endingOffsetY = -startingOffsetY
                                }else if endingOffsetY != 0 && currentDragOffsetY > 150{ // 往下
                                    endingOffsetY = 0
                                    currentDragOffsetY = 0
                                }
                                currentDragOffsetY = 0
                            }
                        }
                )
        }
        .ignoresSafeArea(edges: .bottom)
    }
}

#Preview {
    DragGestureBootcamp2()
}

struct MySignUpView: View {
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "chevron.up")
                .padding(.top)
            Text("Sign up")
                .font(.headline)
                .fontWeight(.semibold)
            Image(systemName: "flame.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
            Text("This is the decription for our app. This is my favorite SwiftUI course and I recommend to all of my friends to subscribe to Swiftful Thinking!")
                .multilineTextAlignment(.center)
                .padding(.horizontal)
            Text("CREATE AN ACCOUNT")
                .foregroundStyle(Color.white)
                .font(.headline)
                .padding()
                .padding(.horizontal)
                .background(Color.black.cornerRadius(10))
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .background(Color.white)
        .cornerRadius(30)
    }
}

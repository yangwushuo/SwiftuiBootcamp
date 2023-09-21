//
//  RotationGestureBootcamp.swift
//  SwiftuiBootcamp
//
//  Created by staircaseprogram on 2023/9/21.
//

import SwiftUI

struct RotationGestureBootcamp: View {
    
    // 旋转参数
    @State var angle: Angle = Angle(degrees: 0)
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .font(.largeTitle)
            .fontWeight(.semibold)
            .foregroundStyle(Color.white)
            .padding(50)
            .background(Color.blue.cornerRadius(50))
            .rotationEffect(angle)
            .gesture(
                // 旋转手势
                RotationGesture()
                    .onChanged{ value in
                        angle = value
                    }
                    .onEnded{ value in
                        withAnimation(.spring(duration: 0.2)) {
                            angle = Angle(degrees: 0)
                        }
                    }
            )
    }
}

#Preview {
    RotationGestureBootcamp()
}

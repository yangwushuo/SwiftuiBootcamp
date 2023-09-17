//
//  BackgroundAndOverlayBootcamp.swift
//  SwiftfulThinkingBottcamp
//
//  Created by Jason on 2023/8/23.
//

import SwiftUI

struct BackgroundAndOverlayBootcamp: View {
    var body: some View {
        // 使用background 布局底层叠加 使用overlay 布局顶层叠加
        Image(systemName: "heart.fill")
            .font(.system(size: 40))
            .foregroundColor(.white)
            .background(
                Circle()
                    .fill(
                        LinearGradient(
                            gradient: Gradient(
                                colors: [
                                    Color(red: 0.14, green: 0.22, blue: 1.0),
                                    Color(red: 0.106, green: 0.22, blue: 0.1)
                                ]
                            ),
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 100)
                    .shadow(
                        color: Color(red: 0.14, green: 0.22, blue: 1.0),
                        radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/,
                        x: 0.0,
                        y: 0.0
                    )
                    .overlay(
                        Circle()
                            .fill(.blue)
                            .frame(width: 35, height: 35)
                            .overlay(
                                Text("1")
                                    .font(.headline)
                                    .foregroundColor(.white)
                            )
                            .shadow(
                                color: Color(red: 0.11, green: 0.22, blue: 1.0),
                                radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/,
                                x: 0.0,
                                y: 0.0
                            ),
                        alignment: .bottomTrailing
                    )
            )
    }
}

#Preview {
    BackgroundAndOverlayBootcamp()
}

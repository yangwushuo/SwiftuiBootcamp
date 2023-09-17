//
//  SafeAreaInsetBootcamp.swift
//  SwiftfulThinkingBottcamp
//
//  Created by Jason on 2023/9/17.
//

import SwiftUI

struct SafeAreaInsetBootcamp: View {
    var body: some View {
        NavigationStack {
            List(0..<10){ value in
                Rectangle()
                    .foregroundStyle(.orange)
                    .frame(width: 200, height: 200)
                    .cornerRadius(50)
                    .overlay {
                        Text("\(value)")
                            .foregroundStyle(.white)
                            .font(.largeTitle)
                    }
            }
            .navigationTitle("Safe Area Insets")
//            .navigationBarTitleDisplayMode(.inline)
            // 安全区域设置
            .safeAreaInset(edge: .top, alignment: .trailing, spacing: nil) {
                Text("Hi")
                    .frame(maxWidth: .infinity)
                    .background(Color.yellow.edgesIgnoringSafeArea(.bottom))
            }
            .safeAreaInset(edge: .bottom, alignment: .center) {
                Text("Hi")
                    .frame(maxWidth: 100)
                    .background(Color.yellow.edgesIgnoringSafeArea(.bottom))
            }
        }
    }
}

#Preview {
    SafeAreaInsetBootcamp()
}

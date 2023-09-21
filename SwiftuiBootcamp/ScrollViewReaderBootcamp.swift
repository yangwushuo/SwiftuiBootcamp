//
//  ScrollViewReaderBootcamp.swift
//  SwiftuiBootcamp
//
//  Created by staircaseprogram on 2023/9/21.
//

import SwiftUI

struct ScrollViewReaderBootcamp: View {
    
    @State var textFieldText: String = ""
    @State var scrollToIndex: Int = 0
    
    var body: some View {
        VStack {
            TextField("Enter a # here...", text: $textFieldText)
                .frame(height: 55)
                .border(Color.gray)
                .padding(.horizontal)
                .keyboardType(.numberPad)
            
            Button("SCROLL NOW") {
                withAnimation {
                    if let index = Int(textFieldText) {
                        scrollToIndex = index
                    }
                }
            }
            
            ScrollView {
                ScrollViewReader { proxy in
                    ForEach(0..<50) { index in
                        Text("This is item #\(index)")
                            .font(.headline)
                            .frame(height: 200)
                            .frame(maxWidth: .infinity)
                            .background(Color.white)
                            .cornerRadius(10)
                            .shadow(radius: 10)
                            .padding()
                            .id(index) // 设置id
                    }
                    .onChange(of: scrollToIndex) { //用于在视图中监测某个特定的数据变化，并在数据变化时执行相应的操作。它允许你监听数据模型的改变，并在数据改变时触发更新视图或执行其他操作。
                        withAnimation {
                            // 滚动到指定id 并显示在视图上方
                            proxy.scrollTo(scrollToIndex, anchor: .top)
                        }
                    }
                }
            }
            
        }
    }
}

#Preview {
    ScrollViewReaderBootcamp()
}

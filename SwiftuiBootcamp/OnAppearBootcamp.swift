//
//  OnAppearBootcamp.swift
//  SwiftfulThinkingBottcamp
//
//  Created by Jason on 2023/9/11.
//

import SwiftUI

struct OnAppearBootcamp: View {
    
    @State var myText: String = "Start text"
    @State var count: Int = 0
    
    /*
     onAppear：当视图在屏幕上显示时，onAppear修饰符中的代码将被执行。这可以用来执行视图出现时需要进行的操作，例如加载数据或执行动画。
     onDisappear：当视图从屏幕上消失时，onDisappear修饰符中的代码将被执行。这可以用来执行视图消失时需要进行的操作，例如停止动画或保存数据。
     */
    var body: some View {
        NavigationView {
            ScrollView {
                Text(myText)
                LazyVStack {
                    ForEach(0..<50) { _ in
                        RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                            .frame(height: 200)
                            .padding()
                            .onAppear {
                                count += 1
                            }
                    }
                }
            }
            .onAppear(perform: {
                DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                    myText = "This is the new text!"
                }
            })
            .onDisappear(perform: {
                myText = "Ending text"
            })
            .navigationTitle("On Appear: \(count)")
        }
    }
}

#Preview {
    OnAppearBootcamp()
}

//
//  SubmitTextFieldBootcamp.swift
//  SwiftfulThinkingBottcamp
//
//  Created by Jason on 2023/9/16.
//

import SwiftUI

struct SubmitTextFieldBootcamp: View {
    
    @State private var text: String = ""
    
    var body: some View {
        VStack {
            TextField("Placeholder", text: $text)
            // 提交按钮显示内容
                .submitLabel(.route)
            // 提交事件
                .onSubmit {
                    print("Someting to the console!")
                }
        }
    }
}

#Preview {
    SubmitTextFieldBootcamp()
}

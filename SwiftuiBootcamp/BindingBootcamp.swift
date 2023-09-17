//
//  BindingBootcamp.swift
//  SwiftfulThinkingBottcamp
//
//  Created by Jason on 2023/9/2.
//

import SwiftUI

struct BindingBootcamp: View {
    
    @State var backgroundColor: Color = .orange
    @State var title: String = "关"
    
    var body: some View {
        ZStack{
            self.backgroundColor
                .ignoresSafeArea()
            VStack{
                Text(self.title)
                    .foregroundColor(.white)
                ButtonView(backgroundColor: $backgroundColor, title: $title)
            }
        }
    }
}

struct ButtonView: View{
    
    // bingding绑定父亲属性
    @Binding var backgroundColor: Color
    @Binding var title: String
    @State var buttonColor: Color = .green
    
    var body: some View {
        Button(action: {
            if self.backgroundColor == .orange{
                self.backgroundColor = .green
                self.buttonColor = .orange
                self.title = "开"
            }else {
                self.backgroundColor = .orange
                self.buttonColor = .green
                self.title = "关"
            }
        }, label: {
            Text("开关")
                .foregroundColor(.white)
                .padding()
                .padding(.horizontal)
                .background(self.buttonColor)
                .cornerRadius(10)
        })
    }
}

#Preview {
    BindingBootcamp()
}

//
//  SheetsBootcamp.swift
//  SwiftfulThinkingBottcamp
//
//  Created by Jason on 2023/9/4.
//

import SwiftUI

struct SheetsBootcamp: View {
    
    @State var showSheet: Bool = false
    
    var body: some View {
        ZStack {
            Color.orange
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            Button(action: {
                self.showSheet.toggle()
            }, label: {
                /*@START_MENU_TOKEN@*/Text("Button")/*@END_MENU_TOKEN@*/
                    .foregroundColor(.gray)
                    .font(.headline)
                    .padding(20)
                    .background(Color.white.cornerRadius(10))
            })
//            .fullScreenCover(isPresented: $showSheet, content: { // 全屏模式
//                SecondScreen()
//            })
            .sheet(isPresented: $showSheet, content: {
                SecondScreen()
            })
        }
    }
}

struct SecondScreen: View {
    
    @Environment(\.presentationMode) var presentationMode
//    具体来说，@Environment(\.presentationMode) 用于获取视图的呈现模式，使你能够在视图中控制它的显示状态。这通常与模态视图（Modal Views）一起使用，以便在需要时关闭模态视图。
    
    var body: some View {
        ZStack(alignment: .topLeading, content: {
            Color.blue
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }, label: {
                Image(systemName: "xmark")
                    .foregroundColor(.white)
                    .font(.largeTitle)
                    .padding(20)
            })
        })
    }
    
}

#Preview {
    SheetsBootcamp()
}

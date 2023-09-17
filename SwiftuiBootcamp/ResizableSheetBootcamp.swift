//
//  ResizableSheetBootcamp.swift
//  SwiftfulThinkingBottcamp
//
//  Created by Jason on 2023/9/17.
//

import SwiftUI

struct ResizableSheetBootcamp: View {
    
    @State private var showSheet: Bool = false
    @State private var detents: PresentationDetent = .large
    var body: some View {
        Button("click me"){
            showSheet.toggle()
        }
        .sheet(isPresented: $showSheet){
            MyNextView(detents: $detents)
            // 数组中添加多种高度拖动距离
//                .presentationDetents([.medium, .large])
            // .fraction 百分比设置 .height 像素高度设置
//                .presentationDetents([.fraction(0.1), .height(300), .medium, .large])
            // selection 绑定拖动 只有列表中含有的值 selection 才奏效
                .presentationDetents([.fraction(0.1), .height( 200), .medium, .large], selection: $detents)
                .presentationDragIndicator(.hidden) // 隐藏顶部拖动控件
//                .interactiveDismissDisabled() // 弹出固定住不能关闭
            
        }
    }
}

struct MyNextView: View {
    
    @Binding var detents: PresentationDetent
    
    var body: some View {
        ZStack {
            Color.orange.ignoresSafeArea()
            Button("高度 200"){
                detents = .height(200)
            }
        }
    }
}

#Preview {
    ResizableSheetBootcamp()
}

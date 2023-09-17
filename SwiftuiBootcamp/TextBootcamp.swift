//
//  TextBootcamp.swift
//  SwiftfulThinkingBottcamp
//
//  Created by Jason on 2023/8/20.
//

import SwiftUI

struct TextBootcamp: View{
    var body: some View {
        Text("Hello, world!11111111111111111111111111111")
//            .font(.body) // 字体样式
            .fontWeight(.semibold) // 字重
            .bold() // 字体加粗
//            .underline() 下划线
            .underline(true, color: .red)
            .italic() // 倾斜
            .strikethrough(true, color: .yellow) // 删除线
            .font(.system(size: 24, weight: .semibold, design: .default))
//            .baselineOffset(-100) // 文本基线偏移
//            .kerning(10) // 调整字符之间的距离
            .multilineTextAlignment(.center) // 多行文本之间的对齐方式
            .foregroundColor(.orange) // 设置文本的颜色
            .frame(width: 200, height: 200, alignment: .center) // 宽高设置 设置文本在宽高位置
            .lineLimit(1) // 设置文本只能一行显示
            .minimumScaleFactor(0.9) // 限制文本缩放比例
    }
    
}

struct TextBootcamp_Previews: PreviewProvider {
    static var previews: some View{
        TextBootcamp()
    }
}

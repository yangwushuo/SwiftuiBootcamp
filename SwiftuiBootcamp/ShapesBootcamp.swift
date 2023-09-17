//
//  ShapesBootcamp.swift
//  SwiftfulThinkingBottcamp
//
//  Created by Jason on 2023/8/20.
//

import SwiftUI

struct ShapesBootcamp: View{
    var body: some View {
//        Circle() // 圆形
//        Ellipse() // 椭圆
//        Capsule() // 带有圆角的长方形
//        Rectangle() // 矩形
        RoundedRectangle(cornerRadius: 25.0) // 表示一个带有圆角的巨星
//            .fill(Color.green) // 用于设置形状（Shape）或视图的填充颜色的属性
//            .foregroundColor(.blue) //是用于设置视图的前景颜色的属性。这个属性用于将颜色应用于视图的前景内容，比如文本、形状或其他内容。
//            .stroke() // 边框
//            .stroke(Color.red)
//            .stroke(Color.blue, lineWidth: 20)
//            .stroke(Color.orange, style: StrokeStyle(lineWidth: 10, lineCap: .round, dash: [30]))
//            .trim(from: 0.4, to: 1) // 以3点为起点
//            .stroke(Color.orange, style: StrokeStyle(lineWidth: 10, lineCap: .round, dash: [1]))
//            .frame(width: 100, height: 100) // 限制宽高

    }
    
}

struct ShapesBootcamp_preview: PreviewProvider {
    static var previews: some View{
        ShapesBootcamp()
    }
}


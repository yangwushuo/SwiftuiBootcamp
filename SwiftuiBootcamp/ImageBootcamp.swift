//
//  ImageBootcamp.swift
//  SwiftfulThinkingBottcamp
//
//  Created by Jason on 2023/8/23.
//

import SwiftUI

struct ImageBootcamp: View{
    var body: some View {
        Image("google_logo")
        // 是用于设置图像的渲染模式（rendering mode）的一个方法。渲染模式决定了图像在显示时如何处理其颜色和透明度。
        // .template：图像将根据其所在环境的颜色进行着色，通常用于创建可适应外部颜色的图标。
        // .original：图像将以其原始颜色显示，不会受到环境颜色的影响。
            .renderingMode(/*@START_MENU_TOKEN@*/.template/*@END_MENU_TOKEN@*/)
            .resizable() // 大小自适应
//            .scaledToFill() // 缩放填充
            .scaledToFit() // 宽高比例填充
            .frame(width: 200, height: 100) // 设置框大小
            .foregroundColor(.blue) // 设置前景色
//            .clipped() // 截取超出的部分
//            .cornerRadius(150) // 圆角
//            .clipShape(
////                Circle() // 正圆图形
////                RoundedRectangle(cornerRadius: 100) // 图形圆角
////                Ellipse() // 椭圆
//            )
        
            
    }
    
}

struct ImageBootcamp_preview: PreviewProvider {
    static var previews: some View{
        ImageBootcamp()
    }
}


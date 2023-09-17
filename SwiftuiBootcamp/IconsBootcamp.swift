//
//  IconsBootcamp.swift
//  SwiftfulThinkingBottcamp
//
//  Created by Jason on 2023/8/22.
//

import SwiftUI

struct IconsBootcamp: View{
    var body: some View {
        Image(systemName: "person.fill.badge.plus")
            .renderingMode(.original)
            .resizable() //当您调整图像或形状的大小时，它们将会等比例地缩放，以适应新的尺寸。
//            .aspectRatio(contentMode: .fit) // fit适应整个容器 fill填充整个容器
            .scaledToFit() // 用于将视图的大小按比例缩放以适应其内容。
//            .scaledToFill() // 用于将视图的大小按比例缩放以填充其内容。
//            .font(.caption)
//            .font(.system(size: 200))
            .foregroundColor(Color(red: 0.422, green: 0.333, blue: 0.544).opacity(0.1)) // 图标颜色
            .frame(width: 100,height: 100)
            .clipped()
    }
    
}

struct IconsBootcamp_preview: PreviewProvider {
    static var previews: some View{
        IconsBootcamp()
    }
}


//
//  MaskBootcamp.swift
//  SwiftuiBootcamp
//
//  Created by staircaseprogram on 2023/9/25.
//

import SwiftUI

struct MaskBootcamp: View {
    
    @State var rating: Int = 0
    
    var body: some View {
        Text("\(rating)评分")
        ZStack {
            startsView
                // mask蒙层添加 注意这里阻止了底层ontap事件
                .overlay(overlayView.mask(startsView))
        }
    }
    
    private var overlayView: some View {
        // 几何
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Rectangle()
                    .foregroundStyle(Color.yellow)
                    .frame(width: CGFloat(rating) / 5 * geometry.size.width)
            }
        }
    }
    
    private var startsView: some View {
        HStack {
            ForEach(1..<6){ index in
                Image(systemName: "star.fill")
                    .font(.largeTitle)
                    .foregroundColor(Color.gray)
                    .onTapGesture {
                        withAnimation(.spring(duration: 0.1)) {
                            rating = index
                        }
                    }
            }
        }
    }
}

#Preview {
    MaskBootcamp()
}

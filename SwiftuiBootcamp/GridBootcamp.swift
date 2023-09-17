//
//  GridBootcamp.swift
//  SwiftfulThinkingBottcamp
//
//  Created by Jason on 2023/8/29.
//

import SwiftUI

struct GridBootcamp: View {
    
    let columns: [GridItem] = [
        GridItem(.flexible(), spacing: 3, alignment: nil),
        GridItem(.flexible(), spacing: 6, alignment: nil),
        GridItem(.flexible(), spacing: 6, alignment: nil)
    ]
    
    var body: some View {
        ScrollView {
            // 垂直网格 columns
            LazyVGrid(
                columns: columns, // 这是一个用于定义网格中列的数组。你可以在这里指定每列的布局方式，例如 .flexible 或 .fixed，以及最小和最大宽度等。columns 数组中的每个元素代表一个网格列。
                alignment: .center,
                spacing: 6,
                pinnedViews: [.sectionHeaders],
                content: {
                Section {
                    ForEach(0..<21) { index in
                        Rectangle()
                            .foregroundColor(.blue)
                            .frame(height: 150)
                            .cornerRadius(25.0)
                    }
                } header: {
                    Text("Section1")
                        .foregroundStyle(.white)
                        .font(.title)
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .center)
                        .background(.orange)
                        .cornerRadius(25.0)
                        .padding()
                    
                }
                Section {
                    ForEach(0..<21) { index in
                        Rectangle()
                            .foregroundColor(.green)
                            .frame(height: 150)
                            .cornerRadius(25.0)
                    }
                } header: {
                    Text("Section2")
                        .foregroundStyle(.white)
                        .font(.title)
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .center)
                        .background(.red)
                        .cornerRadius(25.0)
                        .padding()
                    
                }
            })
        }
    }
}

#Preview {
    GridBootcamp()
}

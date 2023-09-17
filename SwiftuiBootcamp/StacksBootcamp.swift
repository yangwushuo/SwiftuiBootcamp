//
//  StacksBootcamp.swift
//  SwiftfulThinkingBottcamp
//
//  Created by Jason on 2023/8/24.
//

import SwiftUI

struct StacksBootcamp: View {
    var body: some View {
        ZStack(alignment: .top, content: {
            Rectangle()
                .fill(.yellow)
                .frame(width: 350, height: 500, alignment: .center)
            
            VStack(alignment: .leading, content: {
                Rectangle()
                    .fill(.red)
                    .frame(width: 150, height: 150)
                Rectangle()
                    .fill(.green)
                    .frame(width: 100, height: 100)
                HStack(content: {
                    Rectangle()
                        .fill(.purple)
                        .frame(width: 50, height: 50)
                    Rectangle()
                        .fill(.pink)
                        .frame(width: 75, height: 75)
                    Rectangle()
                        .fill(.blue)
                        .frame(width: 25, height: 25)
                })
                .background(.white)
            })
            .background(.blue)
        })
    }
}

#Preview {
    StacksBootcamp()
}

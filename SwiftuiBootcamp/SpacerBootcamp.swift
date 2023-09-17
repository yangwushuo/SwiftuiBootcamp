//
//  SpacerBootcamp.swift
//  SwiftfulThinkingBottcamp
//
//  Created by Jason on 2023/8/27.
//

import SwiftUI

struct SpacerBootcamp: View {
    var body: some View {
        VStack{
            HStack(content: {
                Image(systemName: "xmark")
                // spacer 效果相当于一个会自动伸缩的顶梁柱
                Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
                    .frame(height: 5)
                    .background(.blue)
                Image(systemName: "gear")
            })
            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            .background(.yellow)
            .padding(.horizontal)
            .background(.orange)
            Spacer()
                .frame(width: 10)
                .background(.blue)
            Rectangle()
                .frame(height:  100)
        }
        
    }
}

#Preview {
    SpacerBootcamp()
}

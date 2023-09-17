//
//  ScrollViewBootcamp.swift
//  SwiftfulThinkingBottcamp
//
//  Created by Jason on 2023/8/28.
//

import SwiftUI

struct ScrollViewBootcamp: View {
    var body: some View {
        ScrollView {
            LazyVStack(content: {
                ForEach(1..<100, id: \.self) { count in
                    ScrollView(.horizontal, showsIndicators: false, content: {
                        LazyHStack(content: {
                            ForEach(1...100, id: \.self) { count in
                                RoundedRectangle(cornerRadius: 25.0)
                                    .fill(.orange)
                                    .frame(width:100, height: 100)
                                    .shadow(radius: 2)
                                    .padding(1)
                                    .overlay {
                                        Text("\(count)")
                                            .font(.title)
                                    }
                            }
                        })
                    })
                }
            })
        }
    }
}

#Preview {
    ScrollViewBootcamp()
}

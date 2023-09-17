//
//  ForEachBootcamp.swift
//  SwiftfulThinkingBottcamp
//
//  Created by Jason on 2023/8/28.
//

import SwiftUI

struct ForEachBootcamp: View {
    
    let data: [String] = ["Hi", "Hello", "Hey everyont"]
    let myString: String = "Hello"
    
    var body: some View {
        VStack(content: {
//            ForEach(data.indices) { index in
//                Text("\(data[index]): \(index)")
//            }
//            ForEach(0..<100) { index in
//                Circle()
//                    .frame(height: 50)
//            }
        })
    }
}

#Preview {
    ForEachBootcamp()
}

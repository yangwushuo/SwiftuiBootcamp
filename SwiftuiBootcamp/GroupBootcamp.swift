//
//  GroupBootcamp.swift
//  SwiftfulThinkingBottcamp
//
//  Created by Jason on 2023/9/17.
//

import SwiftUI

struct GroupBootcamp: View {
    var body: some View {
        VStack(spacing: 50){
            Text("yangwushuo")
            
            // 进行编组 
            Group {
                Text("yangwushuo")
                Text("yangwushuo")
            }
            .font(.caption)
            .foregroundColor(.green)
            
        }
        .foregroundColor(.red)
        .font(.headline)
    }
}

#Preview {
    GroupBootcamp()
}

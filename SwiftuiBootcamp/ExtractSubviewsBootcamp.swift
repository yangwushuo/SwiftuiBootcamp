//
//  ExtractSubviewsBootcamp.swift
//  SwiftfulThinkingBottcamp
//
//  Created by Jason on 2023/9/2.
//

import SwiftUI

struct ExtractSubviewsBootcamp: View {
    var body: some View {
        ZStack {
            Color.orange
                .ignoresSafeArea()

            contentLayer
        }
    }
    
    var contentLayer: some View{
        HStack{
            MyItem(title: "Apple", count: 1, color: .red)
            MyItem(title: "Google", count: 2, color: .green)
            MyItem(title: "Alibaba", count: 3, color: .blue)
        }
    }
}

#Preview {
    ExtractSubviewsBootcamp()
}

struct MyItem: View {
    
    let title: String
    let count: Int
    let color: Color
    
    var body: some View {
        VStack{
            Text("\(self.count)")
            Text(self.title)
        }
        .padding()
        .background(
            self.color
        )
        .cornerRadius(10)
    }
}

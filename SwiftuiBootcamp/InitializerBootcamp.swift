//
//  InitializerBootcamp.swift
//  SwiftfulThinkingBottcamp
//
//  Created by Jason on 2023/8/27.
//

import SwiftUI

struct InitializerBootcamp: View {
    
    let backgroundColor: Color
    let count: Int
    let title: String
    
    // 构造初始化
    init(count: Int, fruit: Fruit) {
        self.count = count
        
        if fruit == .apple {
            self.title = "apple"
            self.backgroundColor = .red
        }else{
            self.title = "orange"
            self.backgroundColor = .orange
        }
    }
    
    enum Fruit {
        case apple
        case orange
    }
    
    var body: some View {
        VStack(spacing: 12, content: {
            Text("\(self.count)")
                .font(.largeTitle)
                .foregroundColor(.white)
                .underline()
            Text(self.title)
                .font(.headline)
                .foregroundColor(.white)
        })
        .frame(width: 150, height: 150)
        .background(self.backgroundColor)
        .cornerRadius(10)
    }
}

struct InitializerBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        HStack(content: {
            InitializerBootcamp(count: 12, fruit: .apple)
            InitializerBootcamp(count: 55, fruit: .orange)
        })
    }
}

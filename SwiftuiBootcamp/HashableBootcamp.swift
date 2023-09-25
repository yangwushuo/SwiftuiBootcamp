//
//  HashableBootcamp.swift
//  SwiftuiBootcamp
//
//  Created by staircaseprogram on 2023/9/25.
//

import SwiftUI

struct MyCustomModel: Hashable {
    
    let title: String
    
    // 自定义hash返回值
    func hash(into hasher: inout Hasher) {
        hasher.combine(title)
    }
    
}

struct HashableBootcamp: View {
    
    let data: [MyCustomModel] = [
        MyCustomModel(title: "ONE"),
        MyCustomModel(title: "TWO"),
        MyCustomModel(title: "THERE"),
        MyCustomModel(title: "FOUR"),
        MyCustomModel(title: "FIVE"),
    ]
    
    var body: some View {
        ScrollView {
            VStack(spacing: 40){
                
                //如果自定义类型没有遵循Identifiable协议，但仍然遵循了Hashable协议，那么在ForEach中使用.self作为标识符也是可以的。SwiftUI会使用Hashable协议来区分不同的元素，并根据其哈希值来确定是否需要重新渲染视图。
                ForEach(data, id: \.self) { item in
                    Text(item.hashValue.description)
                        .font(.title)
                }
            }
        }
    }
}

#Preview {
    HashableBootcamp()
}

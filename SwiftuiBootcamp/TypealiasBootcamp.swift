//
//  TypealiasBootcamp.swift
//  SwiftuiBootcamp
//
//  Created by Jason on 2023/10/6.
//

import SwiftUI

struct MovieModel {
    
    let title: String
    let director: String
    let count: Int
    
}

// 类型别名
typealias TVModel = MovieModel

struct TypealiasBootcamp: View {
    
    @State var item: TVModel = TVModel(title: "奥本海默", director: "原子弹之父", count: 22)
    
    var body: some View {
        VStack {
            Text(item.title)
            Text(item.director)
            Text("\(item.count)")
        }
    }
}

#Preview {
    TypealiasBootcamp()
}

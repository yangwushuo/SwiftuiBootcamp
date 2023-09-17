//
//  NavigationStackBootcamp.swift
//  SwiftfulThinkingBottcamp
//
//  Created by Jason on 2023/9/16.
//

import SwiftUI

struct NavigationStackBootcamp: View {
    
    let fruits = ["Apple", "Orange", "Banana"]
    
    @State private var stackPath: [String] = []
    
    var body: some View {
        // 导航堆栈 绑定path 存放当前路由 路径 ， 栈中如果有多个初始值就有多少个初始视图
        NavigationStack (path: $stackPath) {
            
            ScrollView {
                VStack(spacing: 40){
                    
                    Button("Super segue!"){
                        // 路由堆栈中添加导航试图则会自动跳转过去
                        stackPath.append(contentsOf: ["Coconut"])
                    }
                    
                    ForEach(fruits, id: \.self){ fruit in
                        // link 跳转到 frui 对应类型的navigationDestination
                        NavigationLink(value: fruit){
                            Text(fruit)
                        }
                    }
                    
                    // 注意：因为当前栈绑定路由是字符串类型所有 当前数值类型无法跳转
                    ForEach(0..<10){ x in
                        NavigationLink(value: x){
                            Text("Click me:\(x)")
                        }
                    }
                    
                }
            }
            .navigationTitle("Nav Bootcamp")
            // navigationDestination第一个参数for说明可以接受的value值的类型；第二个参数是个返回View的closure，传入被点击的value值，并返回基于这个value值计算出的新View，作为链接目标的下一个页面返回。
            .navigationDestination(for: Int.self){ value in
                MySecondScreen(value: value)
            }
            .navigationDestination(for: String.self) { value in
                Text(value)
            }
        }
    }
}

struct MySecondScreen: View {
    
    let value: Int
    
    init(value: Int){
        self.value = value
    }
    
    var body: some View {
        Text("\(value)")
    }
}

#Preview {
    NavigationStackBootcamp()
}

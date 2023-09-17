//
//  ListSwipeActionBootcamp.swift
//  SwiftfulThinkingBottcamp
//
//  Created by Jason on 2023/9/16.
//

import SwiftUI

struct ListSwipeActionBootcamp: View {
    
    @State var fruits: [String] = [
        "apple", "orange", "banana", "peach"
    ]
    
    var body: some View {
        List{
            ForEach(fruits, id: \.self){ fruit in
                Text(fruit.capitalized)
                /*
                 参数一
                 .leading：表示滑动操作会出现在列表项的左侧。
                 .trailing：表示滑动操作会出现在列表项的右侧。
                 参数二
                 这是一个布尔值参数，用于指定是否允许完全滑动来执行滑动操作。如果将其设置为 true，用户可以完全滑动列表项，触发滑动操作。如果将其设置为 false，则只有部分滑动会触发滑动操作。
                 */
                    .swipeActions(
                        edge: .trailing,
                        allowsFullSwipe: false
                    ){
                        Button("Archive"){
                            
                        }
                        .tint(.orange)
                        Button("Save"){
                            
                        }
                        .tint(.red)
                        Button("Junk"){
                            
                        }
                        .tint(.black)
                    }
                    .swipeActions(
                        edge: .leading,
                        allowsFullSwipe: true
                    ){
                        Button("Archive"){
                            
                        }
                        .tint(.orange)
                    }
                
            }
        }
    }
}

#Preview {
    ListSwipeActionBootcamp()
}

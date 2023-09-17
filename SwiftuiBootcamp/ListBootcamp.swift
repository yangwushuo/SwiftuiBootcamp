//
//  ListBootcamp.swift
//  SwiftfulThinkingBottcamp
//
//  Created by Jason on 2023/9/5.
//

import SwiftUI

struct ListBootcamp: View {
    
    @State var fruits: [String] = [
        "apple", "orange", "banana", "peach"
    ]
    @State var veggies: [String] = [
        "tomato", "potato", "carrot"
    ]
    
    var body: some View {
        NavigationView{
            List {
                Section(
                    header:
                        HStack {
                            Text("Fruits")
                            Image(systemName: "flame.fill")
                        }
                        .font(.headline)
                        .foregroundColor(.orange)
                ){
                    ForEach(fruits, id: \.self) { fruit in
                        Text(fruit.capitalized)
                            .font(.caption)
                            .foregroundColor(.white)
                            .padding(.vertical)
                    }
                    .onDelete(perform: delete) // 添加删除入口
                    .onMove(perform: move) // 添加移动入口
                    .listRowBackground(Color.gray) // 设置列表item的背景颜色
                }
                Section(header: Text("Veggies")){
                    ForEach(veggies, id: \.self){ veggies in
                        Text(veggies.capitalized)
                    }
                } // group 群组是列表
            }
            .navigationTitle("Grocery List") // 设置标题
            .navigationBarItems(leading: EditButton(), trailing: addButton) // 设置标题左右控件
        }
    }
    
    var addButton: some View {
        Button("add"){
            
        }
    }
    
    func delete(indexSet: IndexSet){
        fruits.remove(atOffsets: indexSet) // 删除
    }
    
    func move(indices: IndexSet, newOffset: Int){
        fruits.move(fromOffsets: indices, toOffset: newOffset) // 移动
    }
    
}

#Preview {
    ListBootcamp()
}

//
//  ViewModelBootcamp.swift
//  SwiftfulThinkingBottcamp
//
//  Created by Jason on 2023/9/12.
//

import SwiftUI

struct FruitModel : Identifiable {
    let id: String = UUID().uuidString
    let count: Int
    let name: String
}

class FruitViewModel: ObservableObject {
    
    /*
     @Published 是 Swift 中的属性包装器（property wrapper），通常与 Observable Object 和 Combine 结合使用，用于创建可观察的属性，以便在属性值更改时通知视图更新。它在 SwiftUI 和其他异步编程模型中非常有用。
     用途：
     @Published 通常用于标记一个属性，该属性的值需要被监视和监听。
     当使用 @Published 标记的属性的值发生变化时，它将自动发出通知，告诉其他对象（通常是视图），以便它们可以更新以反映新的属性值。
     与 Observable Object 结合使用：
     @Published 最常与 Observable Object 结合使用，以创建可观察的对象，该对象允许其他对象监听其属性的变化。
     一个拥有 @Published 属性的 Observable Object 类通常用于存储应用程序中的状态数据，这些数据需要在视图中实时更新。
     Combine 框架：
     @Published 与 Combine 框架一起使用，以便将属性值的变化转化为 Combine 发布者（Publisher），以便执行一系列的操作，例如过滤、映射、或与其他数据源进行组合等。
     这使得在复杂的异步场景中处理属性值的变化变得更加方便。
     */
    
    @Published var fruitArray: [FruitModel] = []
    @Published var isLoading: Bool = false
    
    init(){
        getFruits()
    }
    
    func getFruits() {
        let fruit1 = FruitModel(count: 1, name: "Orange")
        let fruit2 = FruitModel(count: 2, name: "Banana")
        let fruit3 = FruitModel(count: 3, name: "Watermelon")

        isLoading = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 5){
            self.fruitArray.append(fruit1)
            self.fruitArray.append(fruit2)
            self.fruitArray.append(fruit3)
            self.isLoading = false
        }
    }
    
    func deleteFruit(index: IndexSet){
        fruitArray.remove(atOffsets: index)
    }
    
}

struct ViewModelBootcamp: View {
    
//    @ObservedObject var fruitViewModel: FruitViewModel = FruitViewModel()
    @StateObject var fruitViewModel: FruitViewModel = FruitViewModel()
    
    /*
     @StateObject 用于在 SwiftUI 视图中创建和管理对象的生命周期。通常，您会使用它来初始化并保存对一个对象的引用，该对象应该与视图一样长寿。
     使用 @StateObject 标记的对象在视图初始化时创建一次，并且只要视图存在，它就会持续存在。如果视图被重新创建（例如，由于其父视图状态的更改），则会重用相同的对象，而不是重新创建。
     这在您拥有一个应该在视图更新和视图层次结构更改时仍然存在的对象时非常有用。
     
     @ObservedObject 用于声明您的视图的某个属性依赖于外部对象的状态。当被观察的对象发生更改时，会通知监听者，视图会自动更新。
     使用 @ObservedObject 标记的对象通常是在外部创建的（例如，在父视图中），然后传递给视图。视图观察此对象的更改并相应地更新自己。
     这在您想要监视外部数据源的更改并在视图中对这些更改作出反应时非常有用。
     
     总之，关键区别在于 @StateObject 用于管理视图内部对象的生命周期，它与视图一起创建和销毁。而 @ObservedObject 用于观察外部对象的更改，通常外部创建并传递给视图。选择使用哪个取决于您是需要控制对象的生命周期还是仅仅观察现有对象的更改。
     
     总结： state 用于和父视图的数据生命周期，视图更新不影响数据， observed 用于子视图，父传递给子视图，子视图观察到父视图发生改变时会更新子视图
     */
    
    var body: some View {
        NavigationView {
            List {
                
                if fruitViewModel.isLoading {
                    ProgressView()
                }else{
                    ForEach(fruitViewModel.fruitArray) { fruit in
                        HStack {
                            Text("\(fruit.count)")
                                .foregroundColor(.red)
                            Text(fruit.name)
                                .font(.headline)
                                .bold()
                        }
                    }
                    .onDelete(perform: fruitViewModel.deleteFruit)
                }
            }
            .listStyle(GroupedListStyle())
            .navigationTitle("Fruit List")
            .navigationBarItems(
                trailing:
                    NavigationLink(
                        destination: RandomScreen(fruitViewModel: fruitViewModel),
                        label: {
                            Image(systemName: "arrow.right")
                                .font(.title)
                        }
                    )
            )
        }
    }
}

struct RandomScreen: View {
    
    @ObservedObject var fruitViewModel: FruitViewModel
    
    var body: some View {
        ZStack {
            Color.gray.ignoresSafeArea()
            
            VStack {
                ForEach(fruitViewModel.fruitArray) { fruit in
                    Text(fruit.name)
                        .foregroundColor(.white)
                        .font(.headline)
                }
            }
        }
    }
}

#Preview {
    ViewModelBootcamp()
}

//
//  WeakSelfBootcamp.swift
//  SwiftuiBootcamp
//
//  Created by Jason on 2023/10/6.
//

import SwiftUI

struct WeakSelfBootcamp: View {
    
    @AppStorage("count") var count: Int?
    
    var body: some View {
        NavigationView {
            NavigationLink("Navigate", destination: WeakSelfSecondScreen())
            .navigationTitle("Screen 1")
        }
        .overlay(
            Text("\(count ?? 0)")
                .font(.largeTitle)
                .padding()
                .padding()
                .background(Color.green.cornerRadius(10))
            , alignment: .topTrailing
        )
    }
}

struct WeakSelfSecondScreen: View {
    
    @StateObject var vm = WeakSelfSecondScreenViewModel()
    
    var body: some View {
        Text("Second View")
            .font(.largeTitle)
            .foregroundStyle(Color.red)
    }
}

class WeakSelfSecondScreenViewModel: ObservableObject {
    
    @Published var data: String? = nil
    
    init() {
        print("Initialize now")
        let currentCount = UserDefaults.standard.integer(forKey: "count")
        UserDefaults.standard.setValue(currentCount + 1, forKey: "count")
        getData()
    }
    
    deinit{
        print("Deinitialize now")
        let currentCount = UserDefaults.standard.integer(forKey: "count")
        UserDefaults.standard.set(currentCount - 1, forKey: "count")
    }
    
    func getData() {
        /*
         ，使用weak self是一种常见的模式，通常用于避免循环引用（retain cycles）问题，特别是在闭包（Closures）中使用强引用（strong reference）捕获self时。循环引用问题会导致内存泄漏，因为对象之间的引用关系形成了一个循环，导致它们无法被释放。
         当你在闭包内部捕获一个对象（通常是self），如果不小心使用了强引用，闭包将会持有这个对象，从而形成了一个循环引用。这种情况下，你可以使用weak self来创建一个弱引用，以防止闭包持有self，从而解决循环引用问题
         强引用与弱引用 如果直接使用self.data赋值，页面在退出的时候不会销毁，因为线程还没有结束。
         会造成每次进入的时候都会进行初始化产生一个强引用，造成堆积，产生性能问题
         如果直接使用self?.data弱引用 避免闭包循环引用，当线程执行到弱引用时候会判断当前self是否还存在，不存在也不会出现错误问题。
         */
        DispatchQueue.main.asyncAfter(deadline: .now() + 500) { [weak self] in
            self?.data = "New Data!!!"
        }
    }
    
}

#Preview {
    WeakSelfBootcamp()
}

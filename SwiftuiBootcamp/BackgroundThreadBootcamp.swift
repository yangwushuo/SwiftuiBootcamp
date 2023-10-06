//
//  BackgroundThreadBootcamp.swift
//  SwiftuiBootcamp
//
//  Created by Jason on 2023/10/6.
//

import SwiftUI

class BackgroundThreadViewModel: ObservableObject {
    
    @Published var dataArray: [String] = []
    
    func fetchData() {
        // 开启线程
        DispatchQueue.global(qos: .background).async {
            let newData = self.downloadData()
            
            print("CHECK 1: \(Thread.isMainThread)") // 是否是主线程
            print("CHECK 1: \(Thread.current)") // 当前线程信息
            
            // 试图数据的更新放在主线程中
            DispatchQueue.main.async {
                self.dataArray = newData
                print("CHECK 2: \(Thread.isMainThread)")
                print("CHECK 2: \(Thread.current)")
            }
        }
    }
    
    private func downloadData() -> [String] {
        var data: [String] = []
        for x in 0..<1000 {
            data.append("\(x)")
        }
        return data
    }
    
}

struct BackgroundThreadBootcamp: View {
    
    @StateObject var vm = BackgroundThreadViewModel()
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 10) {
                Text("LOAD DATA")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .onTapGesture {
                        vm.fetchData()
                    }
                
                ForEach(vm.dataArray, id: \.self) { item in
                    Text(item)
                        .font(.headline)
                        .foregroundStyle(Color.red)
                }
            }
        }
    }
}

#Preview {
    BackgroundThreadBootcamp()
}

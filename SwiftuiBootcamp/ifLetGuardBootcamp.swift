//
//  ifLetGuardBootcamp.swift
//  SwiftfulThinkingBottcamp
//
//  Created by Jason on 2023/9/11.
//

import SwiftUI

struct ifLetGuardBootcamp: View {
    
    @State var currentUserID: String? = nil
    @State var displayText: String? = nil
    @State var isLoading: Bool = false
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Here we are practicing safe coding")
                
                if let text = displayText {
                    Text(text)
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                }
                
                if isLoading {
                    ProgressView()
                }
                
                Spacer()
                
            }
            .navigationTitle("Safe Coding")
            .onAppear {
                loadData2()
            }
        }
    }
    
    func loadData(){
        // 如果有数据则模拟网络请求延时 5 秒加载数据 没有则返回错误信息
        if let userID = currentUserID {
            isLoading = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                displayText = "This is the new data! User id is: \(userID)"
                isLoading = false
            }
        } else {
          displayText = "Error. There is no User ID!"
        }
    }
    
    func loadData2(){
        
        // 如果有用户 id 则 赋值给 userID 做为函数内变量 继续执行后续代码 如果没有 则执行 else 中方法并结束函数
        guard let userID = currentUserID else {
            displayText = "Error. There is no User ID!"
            return
        }
        
        isLoading = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            displayText = "This is the new data! User id is: \(userID)"
            isLoading = false
        }
        
    }
    
}

#Preview {
    ifLetGuardBootcamp()
}

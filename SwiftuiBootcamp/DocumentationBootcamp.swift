//
//  DocumentationBootcamp.swift
//  SwiftfulThinkingBottcamp
//
//  Created by Jason on 2023/9/10.
//

import SwiftUI

struct DocumentationBootcamp: View {
    
    // MARK: 变量
    
    @State var data: [String] = [
        "Apples", "Oranges", "Bananas"
    ]
    @State var showAlert: Bool = false
    
    // MARK: 主体
    
    // NICK - Working copy - things to do
    /*
     这是注释主题
     */
    
    var body: some View {
        NavigationView { // START: NAV
            ZStack {
                // background
                Color.red.ignoresSafeArea()
                
                // foreground
                foregroundLayer
                    .navigationTitle("Documentation")
                    .navigationBarItems(
                        trailing:
                            Button(
                                "弹窗",
                                action:
                                    {
                                        showAlert.toggle()
                                    }
                            )
                    )
                    .alert(
                        isPresented: $showAlert,
                        content: {
                            getAlert(text: "This is the alert!")
                        }
                    )
            }
        } // END: NAV
    }
    
    /// This is the foreground layer that holds a scrollView
    private var foregroundLayer: some View {
        ScrollView { // START: SCROLLV
            Text("Hello")
            ForEach(data, id: \.self){ name in
                Text(name)
                    .font(.headline)
            }
        } // END: SCROLLVsdfa
    }
    
    
    // MARK: 方法
    
    /// 这是详细介绍
    ///
    /// 这是其他详细介绍
    /// ```
    /// 这是是代码介绍
    /// ```
    ///
    /// - Parameter text: 参数说明
    /// - Returns: 返回值说明
    func getAlert(text: String) -> Alert {
        return Alert(title: Text(text))
    }
    
}

    // MARK: 预览

#Preview {
    DocumentationBootcamp()
}

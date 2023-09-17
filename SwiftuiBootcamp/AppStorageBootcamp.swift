//
//  AppStorageBootcamp.swift
//  SwiftfulThinkingBottcamp
//
//  Created by Jason on 2023/9/13.
//

import SwiftUI

struct AppStorageBootcamp: View {
    
    /*
     @AppStorage 是 SwiftUI 中的一个属性包装器（property wrapper），用于在应用程序的用户默认设置（User Defaults）中存储和检索数据。它允许您将应用程序的数据持久化保存在用户的设备上，以便在应用程序关闭后数据仍然可用
     */
    // 初始读取 key：name 的 value 赋给 currentUserName
    @AppStorage("name") var currentUserName: String?
    
    var body: some View {
        VStack {
            Text(currentUserName ?? "default username")
                .font(.title)
            
            if let name = currentUserName {
                Text(name)
                    .font(.headline)
            }
            
            Button("Save") {
                let name: String = "Emily"
                currentUserName = name
            }
            
        }
        .onAppear(perform: {
            //当使用 @AppStorage 标记的属性的值发生变化时，与该属性绑定的视图会自动更新以反映新的值。这使得您可以轻松地在用户更改应用程序设置时更新界面。
            DispatchQueue.main.asyncAfter(deadline: .now() + 5){
                UserDefaults.standard.set("王\(Date().timeIntervalSince1970)", forKey: "name")
            }
            // 读取指定 key 的 value
//            self.currentUserName =  UserDefaults.standard.string(forKey: "name")
        })
    }
}

#Preview {
    AppStorageBootcamp()
}

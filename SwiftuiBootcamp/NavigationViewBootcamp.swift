//
//  NavigationViewBootcamp.swift
//  SwiftfulThinkingBottcamp
//
//  Created by Jason on 2023/9/4.
//

import SwiftUI

struct NavigationViewBootcamp: View {
    var body: some View {
        NavigationView {
            ScrollView {
                NavigationLink(
                    destination: MyOtherScreen(),
                    label:{
                        Text("Hello world!")
                    }
                )
            }
            .navigationTitle("All Inboxes")
//            .navigationBarTitleDisplayMode(.inline) // 设置显示模式
//            .navigationBarBackButtonHidden(true) // 返回按钮是否隐藏
            // 设置自定义导航栏 左右两边
            .navigationBarItems(
                leading:
                    HStack {
                        Image(systemName: "person.fill")
                        Image(systemName: "flame.fill")
                    },
                trailing:
                    NavigationLink(
                        destination: {
                            MyOtherScreen()
                        },
                        label: {
                            Image(systemName: "gear")
                        }
                    )
                    .accentColor(.orange) // 设置强调颜色
            )
        }
    }
}

struct MyOtherScreen: View {
    var body: some View {
        Color.orange
            .ignoresSafeArea()
    }
}

#Preview {
    NavigationViewBootcamp()
}

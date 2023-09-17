//
//  ToolbarBootcamp.swift
//  SwiftfulThinkingBottcamp
//
//  Created by Jason on 2023/9/17.
//

import SwiftUI

struct ToolbarBootcamp: View {
    
    @State private var text: String = ""
    @State private var paths: [String] = []
    
    var body: some View {
        NavigationStack(path: $paths) {
            ZStack {
                Color.white.ignoresSafeArea()
                ScrollView {
                    TextField("Placeholder", text: $text)
                    ForEach(0..<50){ value in
                        Rectangle()
                            .fill(.orange)
                            .frame(width: 200, height: 200)
                            .cornerRadius(50)
                            .overlay {
                                Text("\(value)")
                                    .font(.largeTitle)
                                    .foregroundColor(.white)
                            }
                    }
                }
            }
            .navigationTitle("Toolbar")
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Image(systemName: "heart.fill")
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Image(systemName: "gear")
                }
            }
//            .toolbar(.hidden, for: .navigationBar) // 隐藏
//            .toolbarBackground(.hidden, for: .navigationBar) // 背景色隐藏
//            .toolbarColorScheme(.dark, for: .navigationBar) // 主题色设置
//            .navigationBarTitleDisplayMode(.inline) //
            .toolbarTitleMenu { // 设置 toolbar 菜单栏
                Button("Screen 1"){
                    paths.append("Screen 1")
                }
                Button("Screen 2"){
                    paths.append("Screen 2")
                }
            }
            .navigationDestination(for: String.self) { value in
                Text("New screen:\(value)")
            }
        }
    }
}

#Preview {
    ToolbarBootcamp()
}

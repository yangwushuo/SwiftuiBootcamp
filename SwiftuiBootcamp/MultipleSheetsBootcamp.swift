//
//  MultipleSheetsBootcamp.swift
//  SwiftuiBootcamp
//
//  Created by staircaseprogram on 2023/9/21.
//

import SwiftUI

struct RandomModel: Identifiable {
    let id = UUID().uuidString
    let title: String
}

struct MultipleSheetsBootcamp: View {
    
    @State var selectedModel: RandomModel? = nil
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                ForEach(0..<50) { index in
                    Button("Button\(index)"){
                        selectedModel = RandomModel(title: "\(index)")
                    }
                }
            }
            // 绑定参数 当参数发生变化对应 sheet内容也发生变化 单项绑定
            .sheet(item: $selectedModel) { model in
                NextScreen(randomModel: model)
            }
        }
    }
}

struct NextScreen: View {
    
    let randomModel: RandomModel
    
    var body: some View {
        Text(randomModel.title)
            .font(.largeTitle)
    }
}

#Preview {
    MultipleSheetsBootcamp()
}

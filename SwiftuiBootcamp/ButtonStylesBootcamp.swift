//
//  ButtonStylesBootcamp.swift
//  SwiftfulThinkingBottcamp
//
//  Created by Jason on 2023/9/16.
//

import SwiftUI

struct ButtonStylesBootcamp: View {
    var body: some View {
        VStack {
            Button {
                
            }label: {
                Text("Button Title")
                    .frame(height: 55)
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
            }
            .buttonStyle(.borderedProminent)
            .buttonBorderShape(.roundedRectangle(radius: 20))
            .controlSize(.large)
            
            Button("Button") {
                
            }
            .frame(height: 55)
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
            .controlSize(.large) // 定义大小
            /*
             .defaultButton: 这是默认的按钮样式，通常在 iOS 上使用。它具有平面外观，没有背景或边框，但会在被点击时显示点击效果。
             .bordered: 这个样式创建一个带边框的按钮，通常在 macOS 上使用。它具有突出的边框，但没有背景颜色。
             .plain: 这个样式创建一个无边框、平面的按钮，适用于需要自定义按钮外观的情况。您可以自定义按钮的外观，例如颜色和字体。
             .link: 这个样式创建一个类似于链接的按钮，通常在 iOS 上使用。它看起来像一个文本链接，并且在被点击时会显示点击效果。
             .borderless: 这个样式创建一个无边框的按钮，通常在 macOS 上使用。它类似于 .plain 样式，但没有边框。
             .borderedProminent: 这个样式创建一个带突出边框的按钮，通常在 macOS 上使用。它具有突出的边框，用于引起用户的注意。
             .capsule: 这个样式创建一个带胶囊形状的按钮，适用于需要圆角形状的按钮。
             .bar: 这个样式创建一个适用于导航栏工具栏的按钮。
             .borderlessProminent: 这个样式创建一个带突出边框的无边框按钮，通常在 macOS 上使用。它具有带边框的外观，但没有背景颜色。
             */
            .buttonStyle(.bordered) // 定义样式
            
            Button("Button") {
                
            }
            .frame(height: 55)
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
            .controlSize(.large)
//            用于让 SwiftUI 自动选择按钮的样式，以根据上下文和操作系统的外观来确定最佳的按钮样式。
            .buttonStyle(.automatic)
            
            Button("Button") {
                
            }
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .controlSize(.large)
//            它用于创建一个无边框的按钮，通常看起来像一个文本链接，没有明显的背景色或边框
            .buttonStyle(.borderless)
            
            Button("Button") {
                
            }
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .controlSize(.large)
//            一种非常简单、无边框和无背景色的样式，通常表现为一个没有明显外观的文本按钮。
            .buttonStyle(.plain)
        }
        .padding()
    }
}

#Preview {
    ButtonStylesBootcamp()
}

//
//  BadgesBootcamp.swift
//  SwiftfulThinkingBottcamp
//
//  Created by Jason on 2023/9/16.
//

import SwiftUI

struct BadgesBootcamp: View {
    var body: some View {
//        List {
//            Text("Hello Jason")
//                .badge(1)
//            Text("Hello Jason")
//                .badge(
//                    Text("name")
//                        .font(.largeTitle)
//                        .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
//                )
//            Text("Hello Jason")
//            Text("Hello Jason")
//            Text("Hello Jason")
//        }
        TabView {
            Color.red
                .tabItem {
                    Image(systemName: "heart.fill")
                    Text("Hello")
                }
                .badge("NEW")
            Color.gray
                .tabItem {
                    Image(systemName: "heart.fill")
                    Text("Hello")
                }
                .badge(/*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
            Color.green
                .tabItem {
                    Image(systemName: "heart.fill")
                    Text("Hello")
                }
        }
    }
}

#Preview {
    BadgesBootcamp()
}

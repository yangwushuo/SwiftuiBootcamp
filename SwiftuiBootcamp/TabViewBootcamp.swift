//
//  TabViewBootcamp.swift
//  SwiftfulThinkingBottcamp
//
//  Created by Jason on 2023/9/10.
//

import SwiftUI

struct TabViewBootcamp: View {
    
    @State var selectedTab: Int = 0
    
    let icons: [String] = [
        "heart.fill", "globe", "house.fill", "person.fill"
    ]
    
    var body: some View {
        tabview1
    }
    
    // 轮播图 
    var tabview1: some View {
        TabView {
            ForEach(icons, id: \.self) { icon in
                Image(systemName: icon)
                    .resizable()
                    .scaledToFit()
                    .padding(30)
            }
        }
        .background(
            RadialGradient(gradient: Gradient(colors: [.red, .blue]), center: .center, startRadius: 5, endRadius: 300)
        )
        .frame(height: 300)
        .tabViewStyle(PageTabViewStyle())
    }
    
    // 底部导航栏
    var tabview2: some View {
        TabView(selection: $selectedTab) {
            
            HomeView(selectedTab: $selectedTab)
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Browse")
                }
                .tag(0)
            
            Text("Browse Tab")
                .tabItem {
                    Image(systemName: "globe")
                    Text("Browse")
                }
                .tag(1)
            
            Text("Profile Tab")
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("Browse")
                }
                .tag(2)
        }
        .accentColor(.red)
    }
}

#Preview {
    TabViewBootcamp()
}

struct HomeView: View {
    
    @Binding var selectedTab: Int
    
    var body: some View {
        VStack {
            Text("Home Tab")
            Button(
                action: {
                    selectedTab = 2
                },
                label: {
                    Text("go tab2")
                        .font(.title)
                        .foregroundColor(.white)
                        .padding()
                        .background(.orange)
                        .cornerRadius(25)
                }
            )
        }
    }
}

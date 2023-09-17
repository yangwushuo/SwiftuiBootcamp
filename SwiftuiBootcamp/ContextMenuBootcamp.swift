//
//  ContextMenuBootcamp.swift
//  SwiftfulThinkingBottcamp
//
//  Created by Jason on 2023/9/6.
//

import SwiftUI

struct ContextMenuBootcamp: View {
    
    @State var backgroundColor: Color = .orange
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10){
            Image(systemName: "house.fill")
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            Text("Swiftful Thinking")
                .font(.headline)
            Text("How to use Context Menu")
                .font(.subheadline)
        }
        .foregroundColor(.white)
        .padding(30)
        .background(backgroundColor.cornerRadius(15))
        .contextMenu(
            ContextMenu(
                menuItems: {
                    Button(
                        action: {
                            backgroundColor = .yellow
                        },
                        label: {
                            Label("Share post", systemImage: "flame.fill")
                        }
                    )
                    Button(
                        action:{
                            backgroundColor = .gray
                        },
                        label: {
                            Text("Report post")
                        }
                    )
                    Button(
                        action: {
                            backgroundColor = .blue
                        },
                        label: {
                            HStack {
                                Text("Like post")
                                Image(systemName: "heart.fill")
                            }
                        }
                    )
                }
            )
        )
    }
}

#Preview {
    ContextMenuBootcamp()
}

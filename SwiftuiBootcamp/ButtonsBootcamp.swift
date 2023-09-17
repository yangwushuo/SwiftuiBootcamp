//
//  ButtonsBootcamp.swift
//  SwiftfulThinkingBottcamp
//
//  Created by Jason on 2023/9/2.
//

import SwiftUI

struct ButtonsBootcamp: View {
    
    @State var title: String = "This is my title"
    
    var body: some View {
        VStack(spacing: 20, content: {
            
            Text(title)
                .font(.largeTitle)
                .fontWeight(.bold)
                .shadow(color: .black, radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
            
            Button("按钮1") {
                self.title = "This is my title1"
            }
            .accentColor(.orange)
            
            Button(action: {
                self.title = "This is my title2"
            }, label: {
                Text("按钮2")
                    .font(.headline)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .padding()
                    .padding(.horizontal, 20)
                    .background(
                        Color.blue
                            .cornerRadius(10)
                            .shadow(color: .blue, radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                    )
            })
            
            Button(action: {
                self.title = "This is my title4"
            }, label: {
                Circle()
                    .stroke(Color.black, lineWidth: 2)
                    .frame(width: 75, height: 75)
                    .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                    .overlay {
                        Image(systemName: "heart.fill")
                            .font(.largeTitle)
                            .foregroundColor(.black)
                            
                    }
            })
            
            Button(action: {
                self.title = "This is my title4"
            }, label: {
                Text("按钮4")
                    .font(.caption)
                    .bold()
                    .foregroundColor(.gray)
                    .padding()
                    .padding(.horizontal, 10)
                    .background(
                        Capsule()
                            .stroke(Color.gray, lineWidth: 2.0)
                    )
            })
        })
    }
}

#Preview {
    ButtonsBootcamp()
}

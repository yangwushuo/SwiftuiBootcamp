//
//  SafeAreaBootcamp.swift
//  SwiftfulThinkingBottcamp
//
//  Created by Jason on 2023/9/2.
//

import SwiftUI

struct SafeAreaBootcamp: View {
    var body: some View {
        ScrollView {
            VStack{
                Text("Title goes here")
                    .font(.largeTitle)
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                ForEach(0..<10){ index in 
                    RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                        .fill(.white)
                        .frame(height: 150)
                        .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                        .padding(20)
                }
            }
        }
        .background(
            Color.red
                .ignoresSafeArea()
        )
    }
}

#Preview {
    SafeAreaBootcamp()
}

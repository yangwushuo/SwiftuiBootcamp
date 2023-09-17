//
//  TapGestureBootcamp.swift
//  SwiftfulThinkingBottcamp
//
//  Created by Jason on 2023/9/11.
//

import SwiftUI

struct TapGestureBootcamp: View {
    
    @State var isSelected: Bool = false
    
    var body: some View {
        VStack(spacing: 40){
            RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                .frame(height: 200)
                .foregroundColor(isSelected ? .green : .red)
                .onTapGesture {
                    isSelected.toggle()
                }
            
            Button(
                action:
                    {
                        isSelected.toggle()
                    },
                label:
                    {
                        Text("Button")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(height: 55)
                            .frame(maxWidth: .infinity)
                            .background(.blue)
                            .cornerRadius(25)
                    }
            )
            
            Text("TAP Gesture")
                .font(.headline)
                .foregroundColor(.white)
                .frame(height: 55)
                .frame(maxWidth: .infinity)
                .background(.blue)
                .cornerRadius(25)
//                .onTapGesture {
//                    isSelected.toggle()
//                }
                .onTapGesture(
                    count: 2, // 点击两次才会执行方法
                    perform: {
                        isSelected.toggle()
                    }
                )
        }
        .padding()
    }
}

#Preview {
    TapGestureBootcamp()
}

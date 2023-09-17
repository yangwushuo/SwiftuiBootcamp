//
//  PopoverBootcamp.swift
//  SwiftfulThinkingBottcamp
//
//  Created by Jason on 2023/9/4.
//

import SwiftUI

struct PopoverBootcamp: View {
    @State var showSheet: Bool = false
    
    var body: some View {
        ZStack {
            Color.orange
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            Button(action: {
                self.showSheet.toggle()
            }, label: {
                /*@START_MENU_TOKEN@*/Text("Button")/*@END_MENU_TOKEN@*/
                    .foregroundColor(.gray)
                    .font(.headline)
                    .padding(20)
                    .background(Color.white.cornerRadius(10))
            })
            
            // 第一种 sheet方式
            // 第二种 zstack方式
//            ZStack {
//                if self.showSheet {
//                    NewScreen(showSheet: $showSheet)
//                        .padding(.top, 100)
//                        .transition(.move(edge: .bottom))
//                        .animation(.spring)
//                }
//            }
//            .zIndex(2)
            // 第三种 offset方式
            NewScreen(showSheet: $showSheet)
               .padding(.top, 100)
               .offset(y: showSheet ? 0 : UIScreen.main.bounds.height)
               .animation(.spring())
        }
    }
}

struct NewScreen: View {
    
    @Binding var showSheet: Bool
    
    var body: some View {
        ZStack(alignment: .topLeading, content: {
            Color.blue
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            Button(action: {
                self.showSheet = false
            }, label: {
                Image(systemName: "xmark")
                    .foregroundColor(.white)
                    .font(.largeTitle)
                    .padding(20)
            })
        })
    }
    
}

#Preview {
    PopoverBootcamp()
}

//
//  StateBootcamp.swift
//  SwiftfulThinkingBottcamp
//
//  Created by Jason on 2023/9/2.
//

import SwiftUI

struct StateBootcamp: View {
    
    @State var backgroundColor: Color = .green
    @State var myTitle: String = "My Title"
    @State var count: Int = 0
    
    var body: some View {
        ZStack(alignment: .center) {
            self.backgroundColor
                .ignoresSafeArea()
            
            VStack(spacing: 20, content: {
                Text(myTitle)
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                Text("Count: \(count)")
                    .font(.headline)
                    .underline()
                HStack(spacing: 20, content: {
                    Button("Button 1"){
                        self.backgroundColor = .red
                        self.myTitle = "Button 1 was pressed"
                        self.count += 1
                    }
                    Button("Button 2"){
                        self.backgroundColor = .orange
                        self.myTitle = "Button 2 was pressed"
                        self.count -= 1
                    }
                })
            })
        }
    }
}

#Preview {
    StateBootcamp()
}

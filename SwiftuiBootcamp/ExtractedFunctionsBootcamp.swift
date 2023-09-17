//
//  ExtractedFunctionsBootcamp.swift
//  SwiftfulThinkingBottcamp
//
//  Created by Jason on 2023/9/2.
//

import SwiftUI

struct ExtractedFunctionsBootcamp: View {
    
    @State var backgroundColor: Color = .pink
    
    var body: some View {
        ZStack {
            // background
            backgroundColor
                .ignoresSafeArea()
            // content
            contentLayer
        }
    }
    
    var contentLayer: some View{
        VStack {
            Text("Title")
                .font(.largeTitle)
            
            Button(action:{
              buttonPressed()
            },label: {
                Text("PRESS ME")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.black)
                    .cornerRadius(10)
            })

        }
    }
    
    func buttonPressed(){
        if self.backgroundColor == .pink{
            self.backgroundColor = .blue
        }else {
            self.backgroundColor = .pink
        }
    }
}

#Preview {
    ExtractedFunctionsBootcamp()
}

//
//  SliderBootcamp.swift
//  SwiftfulThinkingBottcamp
//
//  Created by Jason on 2023/9/10.
//

import SwiftUI

struct SliderBootcamp: View {
    
    @State var sliderValue: Double = 3
    @State var color: Color = .red
    
    var body: some View {
        VStack {
            
            Text("Rating:")
            Text(
                String(format: "%.0f", sliderValue)
            )
            .foregroundColor(color)
            
            Slider(value: $sliderValue)
            Slider(value: $sliderValue, in: 1...5)
            Slider(value: $sliderValue, in: 1...5, step: 1.0)
            Slider(
                value: $sliderValue,
                in: 1...5,
                step: 1.0,
                onEditingChanged: { (_) in
                    color = .green
                },
                label: {
                    Text("Title")
                }
            )
            .accentColor(.red)
            
        }
    }
}

#Preview {
    SliderBootcamp()
}

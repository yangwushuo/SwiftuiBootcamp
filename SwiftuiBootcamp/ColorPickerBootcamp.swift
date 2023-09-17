//
//  ColorPickerBootcamp.swift
//  SwiftfulThinkingBottcamp
//
//  Created by Jason on 2023/9/10.
//

import SwiftUI

struct ColorPickerBootcamp: View {
    
    @State var backgroundColor: Color = .gray
    
    var body: some View {
        VStack {
            Rectangle()
                .fill(backgroundColor)
                .frame(width: 200, height: 200)
                .cornerRadius(25)
                .overlay {
                    Text("\(backgroundColor.description)")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding(.horizontal)
                }
            ColorPicker(
                "select color",
                selection: $backgroundColor,
                supportsOpacity: true
            )
            .padding()
            .background(backgroundColor)
            .cornerRadius(10)
            .foregroundColor(.white)
            .font(.headline)
            .padding(50)
        }
    }
}

#Preview {
    ColorPickerBootcamp()
}

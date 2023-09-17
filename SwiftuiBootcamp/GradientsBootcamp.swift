//
//  GradientsBootcamp.swift
//  SwiftfulThinkingBottcamp
//
//  Created by Jason on 2023/8/21.
//

import SwiftUI

struct GradientsBootcamp: View{
    var body: some View {
        VStack(content: {
            RoundedRectangle(cornerRadius: 50)
                .fill(
                    // 线性渐变
                    LinearGradient(
                        gradient: /*@START_MENU_TOKEN@*/Gradient(colors: [Color.red, Color.blue])/*@END_MENU_TOKEN@*/,
                        startPoint: /*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/,
                        endPoint: /*@START_MENU_TOKEN@*/.trailing/*@END_MENU_TOKEN@*/
                    )
                )
                .frame(
                    width: 200,
                    height: 100
                )
            RoundedRectangle(cornerRadius: 50)
                .fill(
                    // 径向渐变
                    RadialGradient(
                        gradient: /*@START_MENU_TOKEN@*/Gradient(colors: [Color.red, Color.blue])/*@END_MENU_TOKEN@*/,
                        center: .leading,
                        startRadius: 10,
                        endRadius: 100
                    )
                )
                .frame(
                    width: 200,
                    height: 100
                )
            RoundedRectangle(cornerRadius: 50)
                .fill(
                    // 角度渐变
                    AngularGradient(
                        gradient: /*@START_MENU_TOKEN@*/Gradient(colors: [Color.red, Color.blue])/*@END_MENU_TOKEN@*/,
                        center: .center,
                        angle: .degrees(180)
                    )
                )
                .frame(
                    width: 200,
                    height: 100
                )
        })
    }
    
}

struct GradientsBootcamp_preview: PreviewProvider {
    static var previews: some View{
        GradientsBootcamp()
    }
}

//
//  ColorsBootcamp.swift
//  SwiftfulThinkingBottcamp
//
//  Created by Jason on 2023/8/20.
//

import SwiftUI

struct ColorsBootcamp: View{
    var body: some View {
        RoundedRectangle(cornerRadius: 50)
            .fill(
//                Color.primary // 系统主颜色
//                Color(red: 233, green: 88, blue: 255)
                Color("CustomColor")
            )
            .frame(width: 200, height: 100)
            .shadow(color: Color("CustomColor").opacity(0.3), radius: 10, x: -20, y: -20)
    }
    
}

struct ColorsBootcamp_preview: PreviewProvider {
    static var previews: some View{
        ColorsBootcamp()
    }
}


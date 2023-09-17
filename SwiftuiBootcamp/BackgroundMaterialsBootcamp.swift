//
//  BackgroundMaterialsBootcamp.swift
//  SwiftfulThinkingBottcamp
//
//  Created by Jason on 2023/9/14.
//

import SwiftUI

struct BackgroundMaterialsBootcamp: View {
    var body: some View {
        VStack{
            Spacer()
            VStack {
                RoundedRectangle(cornerRadius: 4)
                    .frame(width: 50, height: 4)
                    .padding()
                Spacer()
            }
            .frame(height: 350)
            .frame(maxWidth: .infinity)
            .background(.ultraThinMaterial) // 背景材质
            .cornerRadius(30)
        }
        .ignoresSafeArea()
        .background(
            Image("tatumu")
        )
    }
}

#Preview {
    BackgroundMaterialsBootcamp()
}

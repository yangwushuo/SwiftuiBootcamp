//
//  GeometryReaderBootcamp.swift
//  SwiftuiBootcamp
//
//  Created by staircaseprogram on 2023/9/21.
//

import SwiftUI

struct GeometryReaderBootcamp: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(0..<50) { index in
                    GeometryReader { geometry in
                        RoundedRectangle(cornerRadius: 25)
                            .fill(Color.accentColor)
                            .overlay(content: {
                                Text("\(index)")
                                    .font(.largeTitle)
                                    .fontWeight(.semibold)
                                    .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                                    .rotation3DEffect(
                                        Angle(degrees: getPercentage(geo: geometry, index: index) * 40),
                                        axis: (x: 0.0, y: 1.0, z: 0.0)
                                    )
                            })
                            .rotation3DEffect(
                                Angle(degrees: getPercentage(geo: geometry, index: index) * 20),
                                axis: (x: 0.0, y: 1.0, z: 0.0)
                            )
                    }
                    .frame(width: 250, height: 250)
                    .padding()
                }
            }
        }
    }
    
    func getPercentage(geo: GeometryProxy, index: Int) -> Double {
        let maxDistance = UIScreen.main.bounds.width / 2
        let currentX = geo.frame(in: .global).midX
        print("\(index)水平中心坐标\(currentX):\(maxDistance)")
        return Double(1 - (currentX / maxDistance))
    }
}

#Preview {
    GeometryReaderBootcamp()
}

//
//  ToggleBootcamp.swift
//  SwiftfulThinkingBottcamp
//
//  Created by Jason on 2023/9/8.
//

import SwiftUI

struct ToggleBootcamp: View {
    
    @State var toggleIsOn: Bool = false
    
    var body: some View {
        VStack {
            HStack {
                Text("Status:")
                Text(toggleIsOn ? "Online" : "Offline")
            }
            .font(.title)
            
            Toggle(isOn: $toggleIsOn, label: {
                Text("Change status")
            })
            .toggleStyle(SwitchToggleStyle(tint: Color.orange))
            
            Spacer()
        }
        .padding(.horizontal, 100)
    }
}

#Preview {
    ToggleBootcamp()
}

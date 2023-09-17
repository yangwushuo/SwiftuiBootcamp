//
//  StepperBootcamp.swift
//  SwiftfulThinkingBottcamp
//
//  Created by Jason on 2023/9/10.
//

import SwiftUI

struct StepperBootcamp: View {
    
    @State var stepperValue: Int = 10
    @State var widthIncrement: CGFloat = 0
    
    var body: some View {
        VStack {
            Stepper("Stepper: \(stepperValue)", value: $stepperValue)
                .padding(50)
            
            RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                .frame(width: 100+widthIncrement, height: 100)
            
            Stepper("Stepper 2") {
                incrementWidth(amount: 50)
            } onDecrement: {
                incrementWidth(amount: -50)
            }
        }
    }
    
    func incrementWidth(amount: CGFloat) {
        withAnimation(.easeIn) {
            self.widthIncrement += amount
        }
    }
}

#Preview {
    StepperBootcamp()
}

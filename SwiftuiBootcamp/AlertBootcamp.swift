//
//  AlertBootcamp.swift
//  SwiftfulThinkingBottcamp
//
//  Created by Jason on 2023/9/5.
//

import SwiftUI

struct AlertBootcamp: View {
    
    @State var showAlert: Bool = false
    @State var backgroundColor: Color = Color.yellow
    @State var alertType: MyAlerts? = nil
    
    enum MyAlerts{
        case success
        case error
    }
    
    var body: some View {
        ZStack {
            backgroundColor
                .ignoresSafeArea()
            VStack {
                Button("Click here1"){
                    alertType = .error
                    showAlert.toggle()
                }
                Button("Click here2"){
                    alertType = .success
                    showAlert.toggle()
                }
            }
            .alert(isPresented: $showAlert, content: getAlert)
        }
    }
    
    func getAlert() -> Alert {
        
        switch alertType {
        case .error:
            return Alert(title: Text("There was an error!"))
        case .success:
            return Alert(
                title: Text("This was a success!"),
                message: nil,
                dismissButton:
                        .default(
                            Text("OK"),
                            action: {
                                backgroundColor = .green
                            }
                        )
            )
        default:
            return Alert(title: Text("ERROR"))
        }
        
//        return Alert(
//            title: Text("This is the title"),
//            message: Text("Here we will describe the error."),
//            primaryButton:
//                    .destructive(
//                        Text("Delete"),
//                        action: {
//                            backgroundColor = .orange
//                        }
//                    ),
//            secondaryButton: .cancel()
//        )
    }
}

#Preview {
    AlertBootcamp()
}

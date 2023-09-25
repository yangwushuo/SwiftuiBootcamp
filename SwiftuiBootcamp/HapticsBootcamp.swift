//
//  HapticsBootcamp.swift
//  SwiftuiBootcamp
//
//  Created by staircaseprogram on 2023/9/25.
//

import SwiftUI

class HapticManager {
    
    static let instance = HapticManager()
    
    // 以通知类型的反馈震动
    func notification(type: UINotificationFeedbackGenerator.FeedbackType){
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(type)
    }
    
    // 以级别类型的反馈震动
    func impact(style: UIImpactFeedbackGenerator.FeedbackStyle) {
        let generator = UIImpactFeedbackGenerator(style: style)
        generator.impactOccurred()
    }
    
}

struct HapticsBootcamp: View {
    var body: some View {
        VStack(spacing: 20){
            Button(action: {
                HapticManager.instance.notification(type: .success)
            }, label: {
                Text("success")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .foregroundStyle(Color.white)
                    .padding()
                    .background(.orange)
                    .cornerRadius(30)
            })
            Button(action: {
                HapticManager.instance.notification(type: .warning)
            }, label: {
                Text("warning")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .foregroundStyle(Color.white)
                    .padding()
                    .background(.orange)
                    .cornerRadius(30)
            })
            Button(action: {
                HapticManager.instance.notification(type: .error)
            }, label: {
                Text("error")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .foregroundStyle(Color.white)
                    .padding()
                    .background(.orange)
                    .cornerRadius(30)
            })
            Button(action: {
                HapticManager.instance.impact(style: .soft)
            }, label: {
                Text("soft")
                    .font(.title)
                    .foregroundStyle(Color.white)
                    .padding()
                    .background(.orange)
                    .cornerRadius(30)
            })
            Button(action: {
                HapticManager.instance.impact(style: .light)
            }, label: {
                Text("light")
                    .font(.title)
                    .foregroundStyle(Color.white)
                    .padding()
                    .background(.orange)
                    .cornerRadius(30)
            })
            Button(action: {
                HapticManager.instance.impact(style: .medium)
            }, label: {
                Text("medium")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .foregroundStyle(Color.white)
                    .padding()
                    .background(.orange)
                    .cornerRadius(30)
            })
            Button(action: {
                HapticManager.instance.impact(style: .rigid)
            }, label: {
                Text("rigid")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .foregroundStyle(Color.white)
                    .padding()
                    .background(.orange)
                    .cornerRadius(30)
            })
            Button(action: {
                HapticManager.instance.impact(style: .heavy)
            }, label: {
                Text("heavy")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .foregroundStyle(Color.white)
                    .padding()
                    .background(.orange)
                    .cornerRadius(30)
            })
        }
    }
}

#Preview {
    HapticsBootcamp()
}

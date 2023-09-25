//
//  LocalNotificationBootcamp.swift
//  SwiftuiBootcamp
//
//  Created by staircaseprogram on 2023/9/25.
//

import SwiftUI
import UserNotifications
import CoreLocation // 位置

class NotificationManageer {
    
    static let instance = NotificationManageer()
    
    // 发送允许通知请求
    func requestAuthorization() {
        // 通知所包含的参数项
        let options: UNAuthorizationOptions = [.alert, .sound, .badge]
        UNUserNotificationCenter.current().requestAuthorization(options: options) { (success, error) in
            // 允许成功失败处理
            if let error = error {
                print("error \(error)")
            }else {
                print("success")
            }
        }
    }
    
    // 时间通知
    func scheduleNotificationForFiveSecond() {
        
        let content = UNMutableNotificationContent()
        content.title = "这个是你的通知！"
        content.subtitle = "这是我的第一条通知！"
        content.sound = .defaultCritical
        content.badge = 1
        
        // 延迟发送通知 repeats重复通知关闭
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)

        // 请求发送通知
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request)
    }
    
    // 日期通知
    func scheduleNotificationForCalendar() {
        
        let content = UNMutableNotificationContent()
        content.title = "这个是你的通知！"
        content.subtitle = "这是我的第一条通知！"
        content.sound = .defaultCritical
        content.badge = 1
        
        // 定制时间发送通知 repeats重复通知关闭
        var dateComponents = DateComponents()
//        dateComponents.weekday = 2
//        dateComponents.hour = 0
//        dateComponents.minute = 1
        dateComponents.second = 10
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)

        // 请求发送通知
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request)
    }
    
    // 位置定位发送通知
    func scheduleNotificationForLocation(){
        
        let content = UNMutableNotificationContent()
        content.title = "这个是你的通知！"
        content.subtitle = "这是我的第一条通知！"
        content.sound = .defaultCritical
        content.badge = 1
        
        // 定位位置发送通知
        let coordinates = CLLocationCoordinate2D(latitude: 11, longitude: 11)
        let region = CLCircularRegion(center: coordinates, radius: 10000, identifier: UUID().uuidString)
        region.notifyOnEntry = true // 进入范围时发送
        region.notifyOnExit = true // 离开范围时发送
        let trigger = UNLocationNotificationTrigger(region: region, repeats: true)

        // 请求发送通知
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request)
    }
}

struct LocalNotificationBootcamp: View {
    var body: some View {
        VStack {
            Button(action: {
                NotificationManageer.instance.requestAuthorization()
            }, label: {
                Text("请求允许通知")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .foregroundStyle(Color.white)
                    .padding()
                    .background(.orange)
                    .cornerRadius(30)
            })
            Button(action: {
                NotificationManageer.instance.scheduleNotificationForFiveSecond()
            }, label: {
                Text("时间延迟五秒发送")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .foregroundStyle(Color.white)
                    .padding()
                    .background(.orange)
                    .cornerRadius(30)
            })
            Button(action: {
                NotificationManageer.instance.scheduleNotificationForCalendar()
            }, label: {
                Text("日期时间定制发送")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .foregroundStyle(Color.white)
                    .padding()
                    .background(.orange)
                    .cornerRadius(30)
            })
            Button(action: {
                NotificationManageer.instance.scheduleNotificationForLocation()
            }, label: {
                Text("位置推送")
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
    LocalNotificationBootcamp()
}

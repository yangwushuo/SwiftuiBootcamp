//
//  TimerBootcamp.swift
//  SwiftuiBootcamp
//
//  Created by Jason on 2023/10/7.
//

import SwiftUI

struct TimerBootcamp: View {
    
    /*
     这行代码创建了一个定时器（Timer）并使用Combine框架的autoconnect()方法来自动启动定时器。
     具体解释如下：
     Timer.publish(every: 1, on: .main, in: .common)：这部分创建了一个Timer发布者（Publisher）。它指定了以下参数：
     every: 1：表示每隔1秒触发一次定时器。
     on: .main：表示定时器事件将在主线程上触发。这通常用于更新UI，因为UI操作必须在主线程上执行。
     in: .common：表示定时器的模式是.common，这是一个通用模式，适用于大多数情况。它指定了定时器在后台运行时的行为。
     .autoconnect()：这是对Timer发布者的修饰符。它将定时器发布者自动连接到订阅者（Subscriber），以便在创建后立即启动定时器。
     */
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    // 时间显示
    /*
    @State var currentDate: Date = Date()
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.timeStyle = .medium
        return formatter
    }
     */
    
    // 计数
    /*
    @State var count: Int = 10
    @State var finishedText: String? = nil
    */
     
    // 时间倒计时
    /*
    @State var timeRemaining: String = ""
    // 当前加一天
    let futureDate: Date = Calendar.current.date(byAdding: .day, value: 1, to: Date()) ?? Date()
    func updateTimeRemaining() {
        let remaining = Calendar.current.dateComponents([.hour, .minute, .second], from: Date(), to: futureDate)
        let hour = remaining.hour ?? 0
        let minute = remaining.minute ?? 0
        let second = remaining.second ?? 0
        timeRemaining = "\(hour):\(minute):\(second)"
    }
     */
    
    // 动画
    @State var count: Int = 1
    
    var body: some View {
        ZStack {
            RadialGradient(
                gradient: Gradient(colors: [Color.red, .orange]), 
                center: .center,
                startRadius: 5,
                endRadius: 500
            )
            .ignoresSafeArea()
            
//            Text(timeRemaining)
//                .font(.system(size: 100, weight: .semibold, design: .rounded))
//                .foregroundColor(.white)
//                .lineLimit(1)
//                .minimumScaleFactor(0.1)
//                .padding(.horizontal, 30)
            
//            HStack(spacing: 15) {
//                Circle()
//                    .offset(y: count == 1 ? -20 : 0)
//                Circle()
//                    .offset(y: count == 2 ? -20 : 0)
//                Circle()
//                    .offset(y: count == 3 ? -20 : 0)
//            }
//            .frame(width: 150)
//            .foregroundStyle(Color.white)
            
            TabView(
                selection: $count,
                content:  {
                    Rectangle().foregroundStyle(Color.red).tag(1)
                    Rectangle().foregroundStyle(Color.orange).tag(2)
                    Rectangle().foregroundStyle(Color.blue).tag(3)
                    Rectangle().foregroundStyle(Color.yellow).tag(4)
                    Rectangle().foregroundStyle(Color.green).tag(5)
                }
            )
            .frame(height: 200)
            .tabViewStyle(PageTabViewStyle())
        }
        /*
         .onReceive(timer, perform: { value in ... })：这是一个SwiftUI的修饰符，用于监听某个数据流的事件。在这里，它监听了timer发布者的事件，当定时器触发时，闭包中的代码将被执行。
         */
        .onReceive(timer, perform: { value in
            withAnimation(.easeInOut(duration: 1)){
                count = count == 5 ? 1 : count + 1
            }
        })
    }
}

#Preview {
    TimerBootcamp()
}

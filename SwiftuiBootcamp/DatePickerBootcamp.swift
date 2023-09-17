//
//  DatePickerBootcamp.swift
//  SwiftfulThinkingBottcamp
//
//  Created by Jason on 2023/9/10.
//

import SwiftUI

struct DatePickerBootcamp: View {
    
    @State var selectedDate: Date = Date()
    let startingDate: Date = Calendar.current.date(from: DateComponents(year: 2018)) ?? Date()
    let endingDate: Date = Date()
    
    // 计算属性 时间格式
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        return formatter
    }
    
    var body: some View {
        VStack {
            Text("SELECTED DATE IS:")
            Text(dateFormatter.string(from: selectedDate)) // 获取自定义当前时间格式
                .font(.title)
            DatePicker("Select a Date", selection: $selectedDate)
                .datePickerStyle(GraphicalDatePickerStyle())
            DatePicker("Select a Date", selection: $selectedDate, displayedComponents: [.date, .hourAndMinute]) // 限定时间格式
                .datePickerStyle(WheelDatePickerStyle())
            DatePicker("Select a Date", selection: $selectedDate, in: startingDate...endingDate, displayedComponents: [.date]) // 限定时间范围
                .accentColor(.red)
                .datePickerStyle(CompactDatePickerStyle())


        }
    }
}

#Preview {
    DatePickerBootcamp()
}

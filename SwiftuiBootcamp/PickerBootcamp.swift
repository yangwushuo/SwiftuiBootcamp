//
//  PickerBootcamp.swift
//  SwiftfulThinkingBottcamp
//
//  Created by Jason on 2023/9/10.
//

import SwiftUI

struct PickerBootcamp: View {
    
    @State var selection: String = "Most Recent"
    let filterOptions: [String] = [
        "Most Recent", "Most Popular", "Most Liked"
    ]
    
    var body: some View {
        picker1
        picker2
        picker3
    }
    
    var picker1: some View {
        Picker(
            selection: $selection,
            label: Text("Picker"),
            content: {
                ForEach(filterOptions.indices) { index in
                    Text(filterOptions[index])
                        .tag(filterOptions[index])
                }
            }
        )
        .pickerStyle(SegmentedPickerStyle())
    }
    
    var picker2: some View {
        Picker(
            selection: $selection,
            label: HStack {
                    Text("Filter:")
                    Text(selection)
                }
                .font(.headline)
                .foregroundColor(.white)
                .padding()
                .padding(.horizontal)
                .background(.blue)
                .cornerRadius(10)
                .shadow(color: .blue.opacity(0.3), radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x: 0, y: 10)
        ){
            ForEach(filterOptions, id: \.self) { option in
                Text(option)
                    .tag(option)
            }
        }
        .pickerStyle(MenuPickerStyle())
    }
    
    var picker3: some View {
        VStack {
            HStack {
                Text("Age:")
                Text(selection)
            }
            
            Picker(
                selection: $selection,
                label: Text("Picker"),
                content: {
                    ForEach(18..<100) { index in
                        Text("\(index)")
                            .font(.headline)
                            .tag("\(index)")
                    }
                }
            )
        }
    }
    
}

#Preview {
    PickerBootcamp()
}

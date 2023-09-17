//
//  TextEditorBootcamp.swift
//  SwiftfulThinkingBottcamp
//
//  Created by Jason on 2023/9/7.
//

import SwiftUI

struct TextEditorBootcamp: View {
    
    @State var textEditorText: String = "This is the starting text"
    @State var savedText: String = ""
    
    var body: some View {
        NavigationView{
            VStack {
                TextEditor(text: $textEditorText)
                    .frame(height: 250)
                    .colorMultiply(.gray)
                    .cornerRadius(10)
                Button(action: saveInput, label: {
                    Text("Save")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(.blue)
                        .cornerRadius(10)
                })
                Text(savedText)
                Spacer()
            }
            .padding()
            .navigationTitle("TextEditor")
        }
    }
    
    func saveInput() {
        savedText = textEditorText;
    }
}

#Preview {
    TextEditorBootcamp()
}

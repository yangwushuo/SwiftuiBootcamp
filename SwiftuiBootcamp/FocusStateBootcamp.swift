//
//  FocusStateBootcamp.swift
//  SwiftfulThinkingBottcamp
//
//  Created by Jason on 2023/9/16.
//

import SwiftUI

struct FocusStateBootcamp: View {
    
    @FocusState var usernameFocus: Bool
    @FocusState var passwordFocus: Bool
    @State var username: String = ""
    @State var password: String = ""
    @State var isUsernameDone: Bool?
    @State var isPasswordDone: Bool?
    
    enum OnboardingField: Hashable {
        case usename
        case password
    }
    
    var body: some View {
        VStack(spacing: 30){
            HStack {
                TextField("账号", text: $username)
                    .focused($usernameFocus)
//                    .focused($usernameFocus, equals: ) 自定义enum 进行比对
                    .padding(.leading)
                    .frame(height: 55)
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                    .background(Color.gray.brightness(0.3))
                    .cornerRadius(10)
                if let temp = isUsernameDone {
                    temp ?
                    Image(systemName: "checkmark.circle.fill")
                        .font(.title)
                        .foregroundColor(.green)
                    :
                    Image(systemName: "xmark.circle.fill")
                        .font(.title)
                        .foregroundColor(.red)
                }
            }
            
            HStack {
                TextField("密码", text: $password)
                    .focused($passwordFocus)
                    .padding(.leading)
                    .frame(height: 55)
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                    .background(Color.gray.brightness(0.3))
                    .cornerRadius(10)
                if let temp = isPasswordDone {
                    temp ?
                    Image(systemName: "checkmark.circle.fill")
                        .font(.title)
                        .foregroundColor(.green)
                    :
                    Image(systemName: "xmark.circle.fill")
                        .font(.title)
                        .foregroundColor(.red)
                }
            }
            
            Button("Sign in"){
                //
                if !username.isEmpty && !password.isEmpty {
                    isPasswordDone = true
                    isUsernameDone = true
                }else if username.isEmpty {
                    isUsernameDone = false
                    usernameFocus = true
                }else if password.isEmpty{
                    isPasswordDone = false
                    passwordFocus = true
                }
            }
            .buttonStyle(.borderedProminent)
            .controlSize(.large)
            .tint(.orange)
        }
        .padding(40)
        .onAppear{
            // 自动获取焦点
            DispatchQueue.main.asyncAfter(deadline: .now()+1){
                self.usernameFocus = true
            }
        }
    }
}

#Preview {
    FocusStateBootcamp()
}

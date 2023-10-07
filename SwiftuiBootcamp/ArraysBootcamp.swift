//
//  ArraysBootcamp.swift
//  SwiftuiBootcamp
//
//  Created by staircaseprogram on 2023/9/26.
//

import SwiftUI

struct CustomUserModel: Identifiable {
    let id = UUID().uuidString
    var name: String
    var points: Int
    var isVerified: Bool
}

class ArrayModificationViewModel: ObservableObject {
    
    @Published var dataArray: [CustomUserModel] = []
    @Published var filteredArray: [CustomUserModel] = []
    
    init() {
        getUsers()
        updateFiltereArray()
    }
    
    func updateFiltereArray() {
        // filter
        // map
        
        // sort
        /*
        // filteredArray = dataArray.sorted { user1, user2 in
        //    return user1.points > user2.points
        // }
        // 简写
        filteredArray = dataArray.sorted(by: { $0.points > $1.points })
         */
        
        // filter
        /*
        // filteredArray = dataArray.filter({ (user) -> Bool in
        //     return user.points > 80
        // })
        // 简写
        filteredArray = dataArray.filter({ $0.points > 80 })
         */
        
        // map
        /*
        // filteredArray = dataArray.map({ (user) -> CustomUserModel in
        //    return CustomUserModel(name: user.name, points: user.points * 10, isVerified: user.isVerified)
        // })
        // 简写
        filteredArray = dataArray.map({ CustomUserModel(name: $0.name, points: $0.points * 1000, isVerified: $0.isVerified) })
         */
        
        // 组合使用
        filteredArray = dataArray.sorted(by: { $0.points > $1.points })
            .filter({ $0.isVerified })
            .map({ CustomUserModel(name: $0.name, points: $0.points * 1000, isVerified: $0.isVerified) })
    }
    
    func getUsers() {
        dataArray.append(contentsOf: [
            CustomUserModel(name: "Nick", points: 100, isVerified: true),
            CustomUserModel(name: "Yao", points: 200, isVerified: true),
            CustomUserModel(name: "CP3", points: 80, isVerified: false),
            CustomUserModel(name: "Jason", points: 100, isVerified: true),
            CustomUserModel(name: "Hadon", points: 90, isVerified: false),
            CustomUserModel(name: "Lebro", points: 60, isVerified: true),
            CustomUserModel(name: "Kobe", points: 100, isVerified: false),
            CustomUserModel(name: "Mike", points: 10, isVerified: true),
            CustomUserModel(name: "Done", points: 5, isVerified: true),
            CustomUserModel(name: "YI", points: 100, isVerified: true),
            CustomUserModel(name: "WANG", points: 33, isVerified: false),
            CustomUserModel(name: "ZHANG", points: 44, isVerified: true),
        ])
    }
    
}

struct ArraysBootcamp: View {
    
    @StateObject var vm = ArrayModificationViewModel()
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                ForEach(vm.filteredArray) { user in
                    VStack(alignment: .leading) {
                        Text(user.name)
                        HStack {
                            Text("Points: \(user.points)")
                            Spacer()
                            if user.isVerified {
                                Image(systemName: "flame.fill")
                            }
                        }
                    }
                    .foregroundStyle(Color.white)
                    .padding()
                    .background(Color.black.cornerRadius(10))
                    .padding(.horizontal)
                }
            }
        }
    }
}

#Preview {
    ArraysBootcamp()
}

//
//  CodableBootcamp.swift
//  SwiftuiBootcamp
//
//  Created by Jason on 2023/10/6.
//

import SwiftUI

// Codable = Decodable, Encodable
// Decodable 解码 Encodable 编码
struct CustomerModel: Identifiable, Codable {
    
    let id: String
    let name: String
    let points: Int
    let isPremium: Bool
    
    // 注意：以下代码 Codable已经自动生成直接使用即可 ，以下只是原理范例
    // 声明编码解码Key
//    enum CodingKeys: String, CodingKey {
//        case id
//        case name
//        case points
//        case isPremium
//    }
//    
//    init(id: String, name: String, points: Int, isPremium: Bool) {
//        self.id = id
//        self.name = name
//        self.points = points
//        self.isPremium = isPremium
//    }
//    
//    // 初始化解码
//    init(from decoder: Decoder) throws {
//        // 解码
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        // 内容获取
//        self.id = try container.decode(String.self, forKey: .id)
//        self.name = try container.decode(String.self, forKey: .name)
//        self.points = try container.decode(Int.self, forKey: .points)
//        self.isPremium = try container.decode(Bool.self, forKey: .isPremium)
//    }
//    
//    // 编码
//    func encode(to encoder: Encoder) throws {
//        var container = encoder.container(keyedBy: CodingKeys.self)
//        try container.encode(id, forKey: .id)
//        try container.encode(name, forKey: .name)
//        try container.encode(points, forKey: .points)
//        try container.encode(isPremium, forKey: .isPremium)
//    }
    
}

class CodableViewModel: ObservableObject {
    
    @Published var customer: CustomerModel? = nil
    
    init() {
        getData()
    }
    
    func getData() {
        guard let data = getJSONData() else {return}
        // CustomerModel 必须是Codable 或者Decodable
        self.customer = try? JSONDecoder().decode(CustomerModel.self, from: data)
    }
    
    func getJSONData() -> Data? {
//        let dictionary: [String:Any] = [
//            "id": "1134",
//            "name": "Joe",
//            "points": 5,
//            "isPremium": true
//        ]
//        let jsonData = try? JSONSerialization.data(withJSONObject: dictionary, options: [])
        let customer = CustomerModel(id: "111", name: "jason", points: 100, isPremium: true)
        // CustomerModel 必须是Codable 或者Encodable
        let jsonData = try? JSONEncoder().encode(customer)
        return jsonData
    }
    
}

struct CodableBootcamp: View {
    
    @StateObject var vm = CodableViewModel()
    
    var body: some View {
        VStack(spacing: 20) {
            if let customer = vm.customer {
                Text(customer.id)
                Text(customer.name)
                Text("\(customer.points)")
                Text(customer.isPremium.description)
            }
        }
    }
}

#Preview {
    CodableBootcamp()
}

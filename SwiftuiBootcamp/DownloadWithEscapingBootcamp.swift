//
//  DownloadWithEscapingBootcamp.swift
//  SwiftuiBootcamp
//
//  Created by staircaseprogram on 2023/10/7.
//

import SwiftUI

struct PostModel: Identifiable, Codable {
    let userID, id: Int
    let title, body: String

    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case id, title, body
    }
}

class DownloadWithEscapingViewModel: ObservableObject {
    
    @Published var posts: [PostModel] = []
    
    init() {
        getPosts()
    }
    
    func getPosts() {
        
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {return}
        
        downloadData(fromURL: url) { data in
            if let data = data {
                // 解码成PostModel数组
                guard let newPost: [PostModel] = try? JSONDecoder().decode([PostModel].self, from: data) else {return}
                DispatchQueue.main.async { [weak self] in
                    self?.posts = newPost
                }
            }else {
                print("No data")
            }
        }
    }
    
    // handler解码逻辑
    func downloadData(fromURL url: URL, handler: @escaping (_ data: Data?) -> Void){
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard
                let data = data,
                error == nil,
                let response = response as? HTTPURLResponse,
                response.statusCode >= 200 && response.statusCode < 300
            else {
                print("Error downloading data.")
                // 空数据
                handler(nil)
                return
            }
            // 回调
            handler(data)
        }
        .resume()
    }
    
}

struct DownloadWithEscapingBootcamp: View {
    
    @StateObject var vm = DownloadWithEscapingViewModel()
    
    var body: some View {
        List {
            ForEach(vm.posts) { post in
                VStack(alignment: .leading) {
                    Text(post.title)
                        .font(.headline)
                    Text(post.body)
                        .foregroundStyle(Color.blue)
                }
            }
        }
    }
}

#Preview {
    DownloadWithEscapingBootcamp()
}

//
//  DownloadWithCombine.swift
//  SwiftuiBootcamp
//
//  Created by staircaseprogram on 2023/10/7.
//

import SwiftUI
import Combine

struct PostModel2: Identifiable, Codable {
    let userID, id: Int
    let title, body: String

    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case id, title, body
    }
}

class DownloadWithCombineViewModel: ObservableObject {
    
    @Published var posts: [PostModel2] = []
    var cancellables = Set<AnyCancellable>()

    init() {
        getPosts()
    }
    
    func getPosts() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {return}
        /*
         这段代码是使用Combine框架来处理网络请求和数据解析的Swift代码。Combine是苹果提供的一个用于处理异步事件流的框架，通常用于处理订阅和发布数据流的场景。
         URLSession.shared.dataTaskPublisher(for: url): 这一行创建了一个基于URLSession的数据任务发布者。它会执行一个异步网络请求，从指定的URL获取数据，并将数据流发布给后续的操作符。

         .subscribe(on: DispatchSerialQueue.global(qos: .background)): 这一行指定了数据任务发布者应该在后台队列上执行。这意味着网络请求和相关的数据处理将在后台线程上进行，以避免在主线程上执行，阻塞用户界面。

         .receive(on: DispatchQueue.main): 这一行指定了接收到的数据应该在主队列上进行处理。这是因为在主队列上执行UI更新和操作是安全的，而且通常需要在主线程上更新UI。

         .tryMap(handleOutput): 这一行使用tryMap操作符，将接收到的数据通过handleOutput函数进行转换。tryMap函数可以用于对数据进行任何自定义的转换或处理操作。可能需要处理错误，因此它可以抛出异常。

         .decode(type: [PostModel2].self, decoder: JSONDecoder()): 这一行使用decode操作符将接收到的数据解码为指定类型的Swift对象。在这里，它将数据解码为[PostModel2]类型的对象，使用了JSONDecoder进行JSON解析。

         .sink { (completion) in ... } receiveValue: { [weak self] (returnedPosts) in ... }: 这一行使用sink操作符，订阅了数据流。当数据流完成或失败时，它会执行闭包中的代码。receiveValue闭包中的代码将成功解析的returnedPosts赋值给self的posts属性。completion闭包通常用于处理请求的完成状态，但在这个示例中，它没有被使用，因此只是留了一个空的闭包。

         .store(in: &cancellables): 最后，store(in:)操作符将这个订阅存储到了一个名为cancellables的集合中，以确保订阅不会被提前释放。这是Combine框架中的一种常见做法，以确保订阅在不再需要时被正确释放。

         总的来说，这段代码执行了一个网络请求，将返回的JSON数据解析为指定类型的对象，并在主线程上更新UI或执行其他操作。这些操作通过Combine框架中的操作符连接在一起，形成一个数据流处理管道
         */
        URLSession.shared.dataTaskPublisher(for: url)
            .subscribe(on: DispatchSerialQueue.global(qos: .background))
            .receive(on: DispatchQueue.main)
            .tryMap(handleOutput)
            .decode(type: [PostModel2].self, decoder: JSONDecoder())
//            .replaceError(with: []) // 忽略错误给予默认值
//            .sink(receiveValue: { returnedPosts in
//
//            })
            .sink { (completion) in
                
            } receiveValue: { [weak self] (returnedPosts) in
                self?.posts = returnedPosts
            }
            .store(in: &cancellables)
    }
    
    func handleOutput(output: URLSession.DataTaskPublisher.Output) throws -> Data {
        guard let response = output.response as? HTTPURLResponse,
              response.statusCode >= 200 && response.statusCode < 300 else {
            throw URLError(.badServerResponse)
        }
        return output.data
    }
    
}

struct DownloadWithCombine: View {
    @StateObject var vm = DownloadWithCombineViewModel()
    
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
    DownloadWithCombine()
}

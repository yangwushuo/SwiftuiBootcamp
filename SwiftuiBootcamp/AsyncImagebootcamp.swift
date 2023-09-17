//
//  AsyncImagebootcamp.swift
//  SwiftfulThinkingBottcamp
//
//  Created by Jason on 2023/9/14.
//

import SwiftUI

struct AsyncImagebootcamp: View {
    
    let url = URL(string: "https://picsum.photos/400")
    
    var body: some View {
        AsyncImage(url: url) { phase in
            // phase 返回状态 空状态 成功状态 失败状态
            switch phase {
            case .empty:
                ProgressView()
            case .success(let returnedImage):
                returnedImage
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 300)
                    .cornerRadius(20)
            case .failure:
                Image(systemName: "questionmark")
                    .font(.headline)
            default:
                Image(systemName: "questionmark")
                    .font(.headline)
            }
        }
        
        AsyncImage(
            url: url,
            content: { returnedImage in // 返回图片内容
                returnedImage
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 300)
                    .cornerRadius(20)
            },
            placeholder: { // 占位符
                ProgressView()
            }
        )
    }
}

#Preview {
    AsyncImagebootcamp()
}

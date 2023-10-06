//
//  EscapingBootcamp.swift
//  SwiftuiBootcamp
//
//  Created by Jason on 2023/10/6.
//

import SwiftUI

class EscapingViewModel: ObservableObject {
    
    @Published var text: String = "Hello"
    
    func getData() {
        // 闭包使用弱类型
        downloadData3 { [weak self] result in
            self?.text = result
        }
    }
    
    func downloadData() -> String {
        return "Hello Jason!!!"
    }
    
    // 普通函数
    func downloadData2(handler: (_ data: String) -> Void) {
        handler("Hello Jason!!!")
    }
    
    /*
     在Swift中用来表示函数参数是一个逃逸闭包。逃逸闭包是那些在函数执行完成后仍然存在并且可能在稍后的时间点被调用的闭包。@escaping 标记告诉编译器该闭包可能会在函数返回后继续被调用，因此需要额外的内存管理。
     */
    // 使用闭包声明
    func downloadData3(handler: @escaping (_ data: String) -> ()) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            handler("Hello Jason!!!")
        }
    }
    
    func downloadData4(handler: @escaping (DownloadResult) -> ()) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            handler(DownloadResult(data: "Hello Jason!!!"))
        }
    }
    
    func downloadData5(handler: @escaping DownloadHandler) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            handler(DownloadResult(data: "Hello Jason!!!"))
        }
    }
    
    
}

typealias DownloadHandler = (DownloadResult) -> ()

struct DownloadResult {
    let data: String
}

struct EscapingBootcamp: View {
    
    @StateObject var vm = EscapingViewModel()
    
    var body: some View {
        Text(vm.text)
            .font(.largeTitle)
            .foregroundStyle(Color.blue)
            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            .onTapGesture {
                vm.getData()
            }
    }
}

#Preview {
    EscapingBootcamp()
}

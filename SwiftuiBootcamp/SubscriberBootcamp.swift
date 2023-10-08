//
//  SubscriberBootcamp.swift
//  SwiftuiBootcamp
//
//  Created by Jason on 2023/10/9.
//

import SwiftUI
import Combine

class SubscriberViewModel: ObservableObject {
    
    @Published var count: Int = 0
    var cancellables = Set<AnyCancellable>()
    
    @Published var textFieldText: String = ""
    @Published var textIsValid: Bool = false
    
    @Published var showButton: Bool = false
    
    init() {
        addTextFieldSubscriber()
        setUpTimer()
        addButtonSubscriber()
    }
    
    func addTextFieldSubscriber() {
        /*
         这段代码使用Combine框架来监视$textFieldText的变化，并根据一些条件来更新textIsValid属性。下面是这段代码的逐行解释：

         $textFieldText：这是一个使用SwiftUI属性包装器@Published声明的属性。它用于监视文本字段（或文本输入框）的文本内容的变化。
         .debounce(for: .seconds(0.5), scheduler: DispatchQueue.main)：使用debounce操作符来限制数据流的更新频率。在这里，数据流会在0.5秒内没有新值到达时才触发。这是为了避免在用户快速输入文本时频繁触发操作，只在用户停止输入0.5秒后才进行处理。
         .map { (text) -> Bool in ... }：使用map操作符来转换文本输入的值。在这里，闭包会检查文本的长度，如果长度大于3，返回true，否则返回false。这个操作将文本输入映射为一个布尔值，表示输入是否有效。
         .sink(receiveValue: { [weak self] (isValid) in ... })：这是对数据流的订阅操作。.sink操作符接受一个闭包作为参数，该闭包会在数据流发出新值时被调用。在这里，闭包的参数是一个布尔值isValid，表示输入是否有效。
         self?.textIsValid = isvalid：在闭包内部，根据isValid的值更新textIsValid属性。由于在闭包中使用了[weak self]来捕获self的弱引用，所以在闭包执行时需要使用可选链来访问属性，以避免潜在的循环引用问题。
         .store(in: &cancellables)：最后，使用.store(in:)操作符将订阅与一个命名为cancellables的集合相关联。这是为了确保订阅在不再需要时可以正确释放，以避免内存泄漏。通常，你会将订阅存储在一个集合中，并在对象被销毁时取消订阅。
         综合起来，这段代码的作用是监听文本输入字段的文本内容变化，然后通过debounce操作限制触发频率，使用map操作将文本映射为布尔值，表示输入是否有效，最后将结果存储到textIsValid属性中。这可以用于实时验证用户输入并在输入达到某个条件时执行特定的操作。
         */
        $textFieldText
            .debounce(for: .seconds(0.5), scheduler: DispatchQueue.main)
            .map { (text) -> Bool in
                if text.count > 3 {
                    return true
                }
                return false
            }
            .sink(receiveValue: { [weak self] (isvalid) in
                self?.textIsValid = isvalid
            })
            .store(in: &cancellables)
    }
    
    func setUpTimer() {
        /*
         这段代码使用Combine框架中的操作符来创建一个定时器（Timer）并将其与一个订阅者（Subscriber）关联，以便在每次定时器触发时执行特定的操作。下面是这段代码的逐行解释：

         Timer.publish(every: 1, on: .main, in: .common)：这部分创建了一个Timer发布者（Publisher）。它指定了以下参数：
         every: 1：表示每隔1秒触发一次定时器。
         on: .main：表示定时器事件将在主线程上触发。这通常用于更新UI，因为UI操作必须在主线程上执行。
         in: .common：表示定时器的模式是.common，这是一个通用模式，适用于大多数情况。它指定了定时器在后台运行时的行为。
         .autoconnect()：这是对Timer发布者的修饰符。它将定时器发布者自动连接到订阅者，以便在创建后立即启动定时器。
         .sink { [weak self] _ in ... }：这是对发布者的订阅操作。.sink操作符接受一个闭包作为参数，该闭包会在每次定时器触发时被调用。在这里，闭包的参数是一个不使用的占位符_，因为它不需要使用定时器事件的具体值。在闭包内部，使用[weak self]来捕获self的弱引用，以避免潜在的循环引用问题。
         guard let self = self else { return }：这是一个保护性的语句，用于确保在闭包中使用self之前，self仍然存在。如果self已经被释放，那么这个闭包就会提前退出，以避免潜在的崩溃或错误。
         self.count += 1：在闭包内部，它对一个名为count的属性进行递增操作。这可能是用于在每次定时器触发时更新某个计数器或状态。
         .store(in: &cancellables)：最后，使用.store(in:)操作符将订阅与一个命名为cancellables的集合相关联。这是为了确保订阅在不再需要时可以正确释放，以避免内存泄漏。通常，你会将订阅存储在一个集合中，并在对象被销毁时取消订阅。
         综合起来，这段代码的作用是创建一个每秒触发一次的定时器，并在每次触发时递增一个计数器（或执行其他操作）。使用Combine框架的.sink操作符来订阅定时器事件，并通过[weak self]来处理self的弱引用，以确保在需要时正确处理内存管理。最后，使用.store(in:)来管理订阅对象的生命周期。
         */
        Timer
            .publish(every: 1, on: .main, in: .common)
            .autoconnect()
            .sink { [weak self] _ in
                guard let self = self else {return}
                self.count += 1
            }
            .store(in: &cancellables)
    }
    
    func addButtonSubscriber() {
        /*
         
         这段代码使用Combine框架的操作符来监视两个数据流的变化，并在它们的值满足一定条件时更新一个属性。下面是这段代码的逐行解释：

         $textIsValid 和 $count：这是SwiftUI中的属性包装器@Published的属性，它们允许你监视它们的值的变化。$textIsValid 和 $count 是用于访问这些被监视属性的投影（projected）属性。
         .combineLatest($count)：这部分使用combineLatest操作符将两个被监视属性合并成一个元组的数据流。每当其中一个属性的值发生变化时，都会触发一个新元组，包含了textIsValid和count的当前值。
         .sink { [weak self] (isValid, count) in ... }：这是对数据流的订阅操作。.sink操作符接受一个闭包作为参数，该闭包会在数据流发出新值时被调用。在这里，闭包的参数是一个元组(isValid, count)，表示textIsValid和count的当前值。
         guard let self = self else { return }：这是一个保护性的语句，用于确保在闭包中使用self之前，self仍然存在。如果self已经被释放，那么这个闭包就会提前退出，以避免潜在的崩溃或错误。
         if isValid && count >= 10 { self.showButton = true } else { self.showButton = false }：在闭包内部，它根据接收到的isValid和count的值来决定是否将showButton属性设置为true或false。具体地，如果isValid为true并且count大于等于10，那么将showButton设置为true，否则设置为false。
         .store(in: &cancellables)：最后，使用.store(in:)操作符将订阅与一个命名为cancellables的集合相关联。这是为了确保订阅在不再需要时可以正确释放，以避免内存泄漏。通常，你会将订阅存储在一个集合中，并在对象被销毁时取消订阅。
         
         综合起来，这段代码的作用是监听两个数据流（textIsValid和count）的变化，当它们的值满足一定条件时，更新一个名为showButton的布尔属性。这可以用于在用户输入满足某些条件时显示或隐藏按钮，以响应输入的变化。通过使用Combine框架的.combineLatest和.sink操作符，你可以方便地处理这些数据流的变化并采取相应的操作。
         */
        $textIsValid
            .combineLatest($count)
            .sink { [weak self] (isValid, count) in
                guard let self = self else {return}
                if isValid && count >= 10 {
                    self.showButton = true
                } else {
                    self.showButton = false
                }
            }
            .store(in: &cancellables)
    }
    
}

struct SubscriberBootcamp: View {
    
    @StateObject var vm = SubscriberViewModel()
    
    var body: some View {
        VStack {
            Text("\(vm.count)")
                .font(.largeTitle)
            TextField("Type something here...", text: $vm.textFieldText)
                .padding(.leading)
                .frame(height: 55)
                .font(.headline)
                .background(Color.white)
                .cornerRadius(10)
                .overlay(
                    ZStack {
                        Image(systemName: "xmark")
                            .foregroundStyle(Color.red)
                            .opacity(
                                vm.textFieldText.count < 1 ? 0.0 : vm.textIsValid ? 0.0 : 1.0
                            )
                        Image(systemName: "checkmark")
                            .foregroundStyle(Color.green)
                            .opacity(vm.textIsValid ? 1.0 : 0.0)
                    }
                        .font(.title)
                        .padding(.trailing)
                    , alignment: .trailing
                )
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                Text("Submit".uppercased())
                    .font(.headline)
                    .foregroundStyle(Color.white)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(10)
                    .opacity(vm.showButton ? 1.0 : 0.5)
            })
            .disabled(!vm.showButton)
        }
        .padding()
    }
}

#Preview {
    SubscriberBootcamp()
}

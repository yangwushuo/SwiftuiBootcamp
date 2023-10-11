//
//  FileManagerBootcamp.swift
//  SwiftuiBootcamp
//
//  Created by Jason on 2023/10/11.
//

import SwiftUI

class LocalFileManager {
    
    static let instance = LocalFileManager()
    let folderName = "MyApp_Images"
    
    init() {
        createFolderIfNeeded()
    }
    
    // 创建文件夹
    /*
     这段代码是一个Swift函数，用于创建一个文件夹（目录），如果该文件夹不存在的话，通常用于文件管理和数据存储操作。以下是代码的逐行解释：

     guard let path = ...：首先，使用FileManager.default.urls(for:in:)方法获取了一个指向Caches目录的URL，这是一个应用程序可以用来缓存数据的常见目录。.userDomainMask是文件管理器搜索的域，.cachesDirectory是要搜索的特定目录类型。如果无法获取这个URL，就返回，因为接下来的操作需要这个路径。
     .appendingPathComponent(folderName).path：在上一步获取的Caches目录URL上，使用appendingPathComponent方法附加了一个名为folderName的子目录的路径。path属性将这个URL转换为字符串形式，以便后续使用。
     if !FileManager.default.fileExists(atPath: path) { ... }：检查指定路径的文件或目录是否存在。如果指定路径上没有文件或目录，就进入条件块内部。
     try FileManager.default.createDirectory(atPath: path, withIntermediateDirectories: true, attributes: nil)：在上述条件块内，通过FileManager.default.createDirectory方法创建指定路径的文件夹。这个方法的参数包括：
     atPath: path：要创建的文件夹的路径。
     withIntermediateDirectories: true：如果需要，创建中间目录。如果中间目录不存在，也会创建。
     attributes: nil：文件夹的属性，这里没有指定，所以使用默认值。
     print("Success creating folder.")：如果文件夹创建成功，就打印一条成功消息。
     catch let error：如果在创建文件夹时发生错误，就捕获错误并将其存储在error变量中。
     print("Error creating folder. \(error)")：如果出现错误，就打印一条包含错误信息的错误消息。
     总之，这段代码的作用是检查指定路径的文件夹是否存在，如果不存在，则创建它。这通常用于确保在进行文件操作之前，文件夹已经存在，以便在其中存储数据或执行其他文件管理操作。如果文件夹创建成功，就打印一条成功消息，如果出现错误，则打印一条包含错误信息的错误消息。这是一个常见的文件管理操作，特别是在iOS应用中进行数据缓存或本地数据存储时。
     */
    func createFolderIfNeeded() {
        guard
            let path = FileManager
                .default
                .urls(for: .cachesDirectory, in: .userDomainMask)
                .first?
                .appendingPathComponent(folderName)
                .path else {
            return
        }
        
        if !FileManager.default.fileExists(atPath: path) {
            do {
                try FileManager.default.createDirectory(atPath: path, withIntermediateDirectories: true, attributes: nil)
                print("Success creating folder.")
            } catch let error {
                print("Error creating folder. \(error)")
            }
        }
    }
    
    // 删除文件夹
    /*
     这段代码是一个Swift函数，用于删除指定路径上的文件夹（目录）。以下是代码的逐行解释：

     guard let path = ...：首先，与之前的代码一样，使用FileManager.default.urls(for:in:)方法获取了一个指向Caches目录的URL。如果无法获取这个URL，就返回，因为接下来的操作需要这个路径。
     .appendingPathComponent(folderName).path：在上一步获取的Caches目录URL上，使用appendingPathComponent方法附加了一个名为folderName的子目录的路径。path属性将这个URL转换为字符串形式，以便后续使用。
     try FileManager.default.removeItem(atPath: path)：通过FileManager.default.removeItem方法，尝试删除指定路径上的文件夹。这个方法会抛出异常，因此使用try关键字来捕获可能的错误。
     print("Success deleting folder.")：如果删除文件夹成功，就打印一条成功消息。
     catch let error：如果在删除文件夹时发生错误，就捕获错误并将其存储在error变量中。
     print("Error deleting folder. \(error)")：如果出现错误，就打印一条包含错误信息的错误消息。
     总之，这段代码的作用是删除指定路径上的文件夹。它首先构建了要删除的文件夹的路径，然后使用FileManager.default.removeItem方法来尝试删除它。如果删除成功，就打印一条成功消息，如果出现错误，就打印一条包含错误信息的错误消息。这是一个常见的文件管理操作，用于清除不再需要的数据或文件夹。
     */
    func deleteFolder() {
        guard
            let path = FileManager
                .default
                .urls(for: .cachesDirectory, in: .userDomainMask)
                .first?
                .appendingPathComponent(folderName)
                .path else {
            return
        }
        
        do {
            try FileManager.default.removeItem(atPath: path)
            print("Success deleting folder.")
        } catch let error {
            print("Error deleting folder. \(error)")
        }
    }
    
    // 保存图片
    /*
     这段代码是一个Swift函数，用于保存UIImage类型的图像到本地文件系统中。以下是代码的逐行解释：

     guard let data = ...：首先，使用guard语句检查以下条件：
     let data = image.jpegData(compressionQuality: 1.0)：将输入的UIImage图像转换为JPEG格式的二进制数据，压缩质量为1.0（最高质量）。这一步将UIImage转换为可以写入文件的数据。
     let path = getPathForImage(name: name)：调用函数getPathForImage(name:)以获取要保存图像的文件路径。如果无法获取数据或路径，就返回一个错误消息。
     try data.write(to: path)：如果上述guard语句成功通过，就使用try关键字尝试将图像数据写入到指定的文件路径。
     print(path)：如果保存成功，就打印文件路径，以便你可以查看图像被保存到哪里。
     return "Success saving!"：返回一个成功的消息，表示图像保存成功。
     catch let error：如果在保存图像时出现错误，就捕获错误并将其存储在error变量中。
     return "Error saving. \(error)"：如果保存失败，就返回一个包含错误信息的错误消息，其中包括错误的详细信息。
     总之，这段代码的作用是将输入的UIImage图像保存到本地文件系统中。它首先将图像转换为JPEG数据，然后获取保存路径，并尝试将数据写入文件。如果保存成功，就返回成功消息，如果出现错误，就返回包含错误信息的错误消息。这是一个常见的文件操作，用于将图像或其他数据保存到设备上。
     */
    func saveImage(image: UIImage, name: String) -> String {
        guard
            let data = image.jpegData(compressionQuality: 1.0),
            let path = getPathForImage(name: name) else {
            return "Error getting data."
        }
        
        do {
            try data.write(to: path)
            print(path)
            return "Success saving!"
        } catch let error {
            return "Error saving. \(error)"
        }
    }
    
    // 获取图片
    /*
     这段代码是一个Swift函数，用于从本地文件系统中加载图像，并返回一个UIImage对象。以下是代码的逐行解释：

     guard let path = ...：首先，使用guard语句检查以下条件：
     let path = getPathForImage(name: name)?.path：调用函数getPathForImage(name:)以获取特定图像的文件路径，并使用?.path来将返回的URL转换为文件路径。如果无法获取路径，或者路径不存在，就返回nil，并打印错误消息。
     FileManager.default.fileExists(atPath: path)：在上述guard语句中，还检查文件管理器是否存在于指定路径。如果指定路径上的文件存在，就通过这个条件块，否则返回nil。
     UIImage(contentsOfFile: path)：如果文件存在，就尝试使用文件路径来创建一个UIImage对象。UIImage(contentsOfFile: path)方法会尝试加载指定路径上的图像文件并返回相应的UIImage对象。
     return nil：如果无法获取图像或出现错误，就返回nil。
     print("Error getting path.")：在出现错误的情况下，打印错误消息，以便你知道发生了什么问题。
     总之，这段代码的作用是从本地文件系统中加载图像文件，并返回一个UIImage对象。它首先获取文件路径，然后检查文件是否存在，最后尝试加载图像文件并返回UIImage对象。如果文件不存在或出现其他错误，就返回nil，并打印错误消息。这是一个常见的文件操作，用于从本地存储中获取图像或其他数据。
     */
    func getImage(name: String) -> UIImage? {
        guard
            let path = getPathForImage(name: name)?.path,
            FileManager.default.fileExists(atPath: path) else {
            print("Error getting path.")
            return nil
        }
        return UIImage(contentsOfFile: path)
    }
    
    // 删除图片
    /*
     这段代码是一个Swift函数，用于删除本地文件系统中指定名称的图像文件。以下是代码的逐行解释：

     guard let path = ...：首先，使用guard语句检查以下条件：
     let path = getPathForImage(name: name)?.path：调用函数getPathForImage(name:)以获取特定图像的文件路径，并使用?.path来将返回的URL转换为文件路径。如果无法获取路径，或者路径不存在，就返回一个错误消息。
     FileManager.default.fileExists(atPath: path)：在上述guard语句中，还检查文件管理器是否存在于指定路径。如果指定路径上的文件存在，就通过这个条件块，否则返回一个错误消息。
     try FileManager.default.removeItem(atPath: path)：如果文件存在，就尝试使用文件路径来删除文件。FileManager.default.removeItem方法会尝试删除指定路径上的文件。
     return "Successfully deleted."：如果文件成功删除，就返回一个成功的消息。
     catch let error：如果在删除文件时出现错误，就捕获错误并将其存储在error变量中。
     return "Error deleting image. \(error)"：如果删除文件失败，就返回一个包含错误信息的错误消息，其中包括错误的详细信息。
     总之，这段代码的作用是根据指定的图像名称从本地文件系统中删除图像文件。它首先获取文件路径，然后检查文件是否存在，然后尝试删除文件。如果删除成功，就返回成功消息，如果出现错误，就返回包含错误信息的错误消息。这是一个常见的文件操作，用于从本地存储中删除文件。
     */
    func deleteImage(name: String) -> String {
        guard
            let path = getPathForImage(name: name)?.path,
            FileManager.default.fileExists(atPath: path) else {
            return "Error getting path"
        }
        
        do {
            try FileManager.default.removeItem(atPath: path)
            return "Successfully deleted."
        } catch let error {
            return "Error deleting image. \(error)"
        }
    }
    
    // 获取文件路径
    /*
     这段代码是一个Swift函数，用于获取本地文件系统中图像文件的路径。以下是代码的逐行解释：

     guard let path = ...：首先，使用guard语句检查以下条件：
     let path = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first：通过FileManager.default.urls(for:in:)方法获取一个指向Caches目录的URL，这是一个应用程序可以用来缓存数据的常见目录。.userDomainMask是文件管理器搜索的域。
     .appendingPathComponent(folderName)：在上述的Caches目录URL上，使用appendingPathComponent方法附加了一个名为folderName的子目录的路径。
     .appendingPathComponent("\(name).jpeg")：再次使用appendingPathComponent方法附加了指定名称的图像文件名，通常是JPEG文件。这将返回最终的图像文件的URL。
     return path：如果成功创建了文件的URL路径，就返回该URL。
     print("Error getting path.")：如果无法获取路径，就打印错误消息，以便你知道发生了什么问题。
     总之，这段代码的作用是根据输入的图像名称创建一个本地文件系统中图像文件的路径。它首先获取Caches目录的URL，然后附加子目录和图像文件名，最后返回完整的URL路径。如果无法创建路径，就返回nil，并打印错误消息。这是一个用于获取文件路径的常见辅助函数，通常在保存、加载或删除文件时使用。
     */
    func getPathForImage(name: String) -> URL? {
        guard
            let path = FileManager
                .default
                .urls(for: .cachesDirectory, in: .userDomainMask)
                .first?
                .appendingPathComponent(folderName)
                .appendingPathComponent("\(name).jpeg") else {
            print("Error getting path.")
            return nil
        }
        return path
    }
    
}

class FileManagerViewModel: ObservableObject {
    
    @Published var image: UIImage? = nil
    let imageName: String = "tatumu"
    let manager = LocalFileManager.instance
    @Published var infoMessage: String = ""
    
    init() {
        getImageFromAssetsFolder()
    }
    
    func getImageFromAssetsFolder() {
        image = UIImage(named: imageName)
    }
    
    func getImageFromFileManager() {
        image = manager.getImage(name: imageName)
    }
    
    func saveImage() {
        guard let image = image else {return}
        infoMessage = manager.saveImage(image: image, name: imageName)
    }
    
    func deleteImage() {
        infoMessage = manager.deleteImage(name: imageName)
    }
}

struct FileManagerBootcamp: View {
    @StateObject var vm = FileManagerViewModel()
       
       var body: some View {
           NavigationView {
               VStack {
                   
                   if let image = vm.image {
                       Image(uiImage: image)
                           .resizable()
                           .scaledToFill()
                           .frame(width: 200, height: 200)
                           .clipped()
                           .cornerRadius(10)
                   }
                   
                   HStack {
                       Button(action: {
                           vm.saveImage()
                       }, label: {
                           Text("Save to FM")
                               .foregroundColor(.white)
                               .font(.headline)
                               .padding()
                               .padding(.horizontal)
                               .background(Color.blue)
                               .cornerRadius(10)
                       })
                       Button(action: {
                           vm.deleteImage()
                       }, label: {
                           Text("Delete from FM")
                               .foregroundColor(.white)
                               .font(.headline)
                               .padding()
                               .padding(.horizontal)
                               .background(Color.red)
                               .cornerRadius(10)
                       })
                   }
                   
                   Text(vm.infoMessage)
                       .font(.largeTitle)
                       .fontWeight(.semibold)
                       .foregroundColor(.purple)
                   
                   
                   
                   Spacer()
               }
               .navigationTitle("File Manager")
           }
       }
}

#Preview {
    FileManagerBootcamp()
}

//
//  SoundsBootcamp.swift
//  SwiftuiBootcamp
//
//  Created by staircaseprogram on 2023/9/25.
//

import SwiftUI
import AVKit

class SoundManager {
    
    static let instance = SoundManager() // 单例
    
    var player: AVAudioPlayer?
    
    enum SoundOption: String {
        case dida1
        case dida2
    }
    
    func playSound(sound: SoundOption){
        
        guard let url = Bundle.main.url(forResource: sound.rawValue, withExtension: ".mp3") else { return }
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        } catch let error {
            print("Error playing sound. \(error.localizedDescription)")
        }
        
    }
    
}

struct SoundsBootcamp: View {
    var body: some View {
        VStack(spacing: 20){
            Button(action: {
                SoundManager.instance.playSound(sound: .dida1)
            }, label: {
                Text("dida1")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .foregroundStyle(Color.white)
                    .padding()
                    .background(.orange)
                    .cornerRadius(30)
            })
            Button(action: {
                SoundManager.instance.playSound(sound: .dida2)
            }, label: {
                Text("dida2")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .foregroundStyle(Color.white)
                    .padding()
                    .background(.orange)
                    .cornerRadius(30)
            })
        }
        
    }
}

#Preview {
    SoundsBootcamp()
}

//
//  SoundManager.swift
//  FT Times
//
//  Created by NomoteteS on 24.02.2023.
//

import Foundation
import AVKit

class SoundManager {
    
    static let share = SoundManager()
    
    var player : AVAudioPlayer?
    
    enum SoundCase: String {
        case media11 = "media11"
        case media12 = "media12"
        case media21 = "media21"
        case media22 = "media22"
    }
    
    func playSound(sound: SoundCase, Volume : Float) {
        
        guard let url = Bundle.main.url(forResource: sound.rawValue, withExtension: ".mp3") else { return }
        player?.volume = Volume
        
        do {
            try player = AVAudioPlayer(contentsOf: url)
            player?.play()
        } catch let error {
            print("error massage : \(error.localizedDescription)")
        }
    }
}

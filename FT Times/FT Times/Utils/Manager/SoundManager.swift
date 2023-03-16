//
//  SoundManager.swift
//  FT Times
//
//  Created by NomoteteS on 24.02.2023.
//

import Foundation
import AVKit

class Media11 {
    
    static let share = Media11()
    
    var player : AVAudioPlayer?
    
    func playMedia(volume: Float) {
        guard let url = Bundle.main.url(forResource: "media11", withExtension: ".mp3") else { return }
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
            player?.volume = volume
        } catch let error {
            print("error massage : \(error.localizedDescription)")
        }
    }
}

class Media12 {
    
    static let share = Media12()
    
    var player : AVAudioPlayer?
    
    func playMedia(volume: Float) {
        guard let url = Bundle.main.url(forResource: "media12", withExtension: ".mp3") else { return }
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
            player?.volume = volume
        } catch let error {
            print("error massage : \(error.localizedDescription)")
        }
    }
}


class Media21 {
    
    static let share = Media21()
    
    var player : AVAudioPlayer?
    
    func playMedia(volume: Float) {
        guard let url = Bundle.main.url(forResource: "media21", withExtension: ".mp3") else { return }
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
            player?.volume = volume
        } catch let error {
            print("error massage : \(error.localizedDescription)")
        }
    }
}


class Media22 {
    
    static let share = Media22()
    
    var player : AVAudioPlayer?
    
    func playMedia(volume: Float) {
        guard let url = Bundle.main.url(forResource: "media22", withExtension: ".mp3") else { return }
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
            player?.volume = volume
        } catch let error {
            print("error massage : \(error.localizedDescription)")
        }
    }
}

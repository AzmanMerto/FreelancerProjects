//
//  MusicPlayer.swift
//  TOOF Audio
//
//  Created by NomoteteS on 23.04.2023.
//

import AVFoundation

class MusicPlayer: ObservableObject {
    
    static let shared = MusicPlayer()
    var audioPlayer : AVAudioPlayer?
        
}

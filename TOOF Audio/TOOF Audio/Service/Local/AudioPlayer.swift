//
//  AudioPlayer.swift
//  TOOF Audio
//
//  Created by NomoteteS on 31.03.2023.
//

import Foundation
import AVFoundation
import MediaPlayer

class AudioPlayer: ObservableObject {
    let player = AVPlayer()
    
    func play(song: MPMediaItem) {
        guard let url = song.assetURL else { return }
        let playerItem = AVPlayerItem(url: url)
        player.replaceCurrentItem(with: playerItem)
        player.play()
    }
    
    func pause() {
        player.pause()
    }
}

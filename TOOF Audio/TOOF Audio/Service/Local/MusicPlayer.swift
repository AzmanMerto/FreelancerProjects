//
//  MusicPlayer.swift
//  TOOF Audio
//
//  Created by NomoteteS on 31.03.2023.
//

import AVFoundation

class MusicPlayer {
    static let shared = MusicPlayer()
    private var audioPlayer: AVAudioPlayer?
    var currentlyPlayingURL: URL?

    private init() {}
    
    func play(url: URL) {
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.play()
            currentlyPlayingURL = url
        } catch {
            print("FIXto Musicplayer: \(error.localizedDescription)")
        }
    }

    func stop() {
        audioPlayer?.stop()
        audioPlayer = nil
        currentlyPlayingURL = nil
    }

}

//
//  MusicPlayer.swift
//  TOOF Audio
//
//  Created by NomoteteS on 31.03.2023.
//

import AVFoundation

class MusicPlayer {
    
    static var shared = MusicPlayer()
    var currentlyPlayingURL: URL?
    
    @Published var audioPlayer: AVAudioPlayer?
    @Published var duration: TimeInterval
    @Published var volume: Float
        
    init(
        duration: TimeInterval = 0,
        volume: Float = 0.5
        ) {
            self.duration = duration
            self.volume = volume
    }
    
    func startAudioPlayer(url: URL) {
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.volume = volume
            audioPlayer?.play()
            audioPlayer?.prepareToPlay()
            currentlyPlayingURL = url
            
            if let audioPlayer = audioPlayer {
                self.duration = audioPlayer.duration
            }
        } catch {
            print("Audio Player oluşturma hatası: \(error.localizedDescription)")
        }
    }

    func stop() {
        audioPlayer?.stop()
        audioPlayer = nil
        currentlyPlayingURL = nil
    }

    func playPause(isPlaying: Bool) {
        if isPlaying {
            audioPlayer?.stop()
        } else {
            audioPlayer?.play()
        }
    }
    
    func previous(musicFiles: [URL]) {
        
        guard let url = currentlyPlayingURL else { return }
        
        if let currentIndex = musicFiles.firstIndex(of: url), currentIndex > 0 {
            self.currentlyPlayingURL = musicFiles[currentIndex - 1]
            self.startAudioPlayer(url: url)
            self.playPause(isPlaying: true)
        }
    }
    
    func next(musicFiles: [URL]) {
        
        guard let url = self.currentlyPlayingURL else { return }
        
        if let currentIndex = musicFiles.firstIndex(of: self.currentlyPlayingURL!), currentIndex < musicFiles.count - 1 {
            self.currentlyPlayingURL = musicFiles[currentIndex + 1]
            self.startAudioPlayer(url: url)
            self.playPause(isPlaying: true)
        }
    }
    
    func timeString(from interval: TimeInterval) -> String {
        let time = Int(interval)
        let minutes = time / 60
        let seconds = time % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
    
}

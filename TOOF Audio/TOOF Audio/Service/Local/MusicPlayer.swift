//
//  MusicPlayer.swift
//  TOOF Audio
//
//  Created by NomoteteS on 31.03.2023.
//

import AVFoundation

class MusicPlayer: ObservableObject {
    
    static let shared = MusicPlayer()
    var audioPlayer : AVAudioPlayer?
    
    @Published var currentURLPlaying: URL?
    @Published var audioVolume: Float = 0
    @Published var duration: TimeInterval = 0
    
    init() { }
    
    func startMusicPlayer(url: URL) {
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            guard let audioPlayer = audioPlayer else { return }
            audioVolume = audioPlayer.volume
            duration = audioPlayer.duration
            audioPlayer.play()
            currentURLPlaying = url
        } catch {
            print("FIXto MusicPlayer: \(error.localizedDescription)")
        }
    }
    
    func playAndStop(isPlaying: Bool) {
        if isPlaying {
            audioPlayer?.stop()
        }else {
            audioPlayer?.play()
        }
    }
    
    func previous(musicFiles: [URL]) {
        guard let url = currentURLPlaying else { return }
        
        if let currenIndex = musicFiles.firstIndex(of: url), currenIndex > 0 {
            self.currentURLPlaying = musicFiles[currenIndex - 1]
            self.startMusicPlayer(url: url)
        }
    }
    
    func timeString(from interval: TimeInterval) -> String {
        let time = Int(interval)
        let minutes = time / 60
        let seconds = time % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
}
//
//func previous(musicFiles: [URL]) {
//
//    guard let url = currentlyPlayingURL else { return }
//
//    if let currentIndex = musicFiles.firstIndex(of: url), currentIndex > 0 {
//        self.currentlyPlayingURL = musicFiles[currentIndex - 1]
//        self.startAudioPlayer(url: url)
//        self.playPause(isPlaying: true)
//    }
//}
//
//func next(musicFiles: [URL]) {
//
//    guard let url = self.currentlyPlayingURL else { return }
//
//    if let currentIndex = musicFiles.firstIndex(of: self.currentlyPlayingURL!), currentIndex < musicFiles.count - 1 {
//        self.currentlyPlayingURL = musicFiles[currentIndex + 1]
//        self.startAudioPlayer(url: url)
//        self.playPause(isPlaying: true)
//    }
//}

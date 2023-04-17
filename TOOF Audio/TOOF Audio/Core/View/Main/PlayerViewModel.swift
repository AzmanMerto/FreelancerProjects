//
//  PlayerViewModel.swift
//  TOOF Audio
//
//  Created by NomoteteS on 13.04.2023.
//

import Foundation

class PlayerViewModel: ObservableObject {
    
    let musicPlayer = MusicPlayer.shared
    
    @Published var isPlaying: Bool
    @Published var isRandomPlaying: Bool
    @Published var isRepatePlaying: Bool
    @Published var musicFiles: [URL]
    @Published var currenTime: TimeInterval
    @Published var volume: Float
    
    init(isPlaying: Bool = false,
         isRandomPlaying: Bool = false,
         isRepatePlaying: Bool = false,
         musicFiles: [URL],
         currenTime: TimeInterval = 0,
         volume: Float = 0.5
    )
    {
        self.isPlaying = isPlaying
        self.isRandomPlaying = isRandomPlaying
        self.isRepatePlaying = isRepatePlaying
        self.musicFiles = musicFiles
        self.currenTime = currenTime
        self.volume = volume
    }
}

//
//  MainPlayerViewModel.swift
//  TOOF Audio
//
//  Created by NomoteteS on 23.04.2023.
//

import SwiftUI

class MainPlayerViewModel: ObservableObject {
    
    @Published var isOpenPlayerView: Bool
    @Published var isTapedRandom: Bool
    @Published var isPlaying: Bool
    @Published var rotateSection: Int
//    @Published var volume: Int
    @Published var deviceName: String
    @Published var musicName: String
    
    init(isOpenPlayerView: Bool = false,
        isTapedRandom: Bool = false,
         isPlaying: Bool = false,
         rotateSection: Int = 1,
         deviceName: String = "",
         musicName: String = "No music"
    ) {
        self.isOpenPlayerView = isOpenPlayerView
        self.isTapedRandom = isTapedRandom
        self.isPlaying = isPlaying
        self.rotateSection = rotateSection
        self.deviceName = deviceName
        self.musicName = musicName
    }
    
    enum DragState {
        case inactive
        case dragging(translation: CGSize)
        
        var translation: CGSize {
                switch self {
                case .inactive:
                    return .zero
                case .dragging(let translation):
                    return translation
                }
            }
    }
    
}

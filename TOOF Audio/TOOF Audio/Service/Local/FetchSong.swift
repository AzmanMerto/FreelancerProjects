//
//  FetchSong.swift
//  TOOF Audio
//
//  Created by NomoteteS on 2.04.2023.
//

import Foundation
import MediaPlayer

class FetchSong: ObservableObject {
    
    static var shared = FetchSong()
    @Published var mediaItems: [MPMediaItem] = []
    
    func requestPermission() {
        let mediaType = MPMediaType.music
        let authorizationStatus = MPMediaLibrary.authorizationStatus()
        if authorizationStatus == .notDetermined {
            MPMediaLibrary.requestAuthorization { (status) in
                if status == .authorized {
                    self.loadMediaItems(mediaType)
                }
            }
        } else if authorizationStatus == .authorized {
            self.loadMediaItems(mediaType)
        } else {
            // Show alert to the user to grant permission to access music library
            print("Access to media library is not granted.")
        }
    }
    
    func loadMediaItems(_ mediaType: MPMediaType) {
        let query = MPMediaQuery()
        query.addFilterPredicate(MPMediaPropertyPredicate(value: mediaType.rawValue, forProperty: MPMediaItemPropertyMediaType))
        self.mediaItems = query.items ?? []
    }
    
    func playMedia(_ media: MPMediaItem) {
        let player = MPMusicPlayerController.systemMusicPlayer
        player.setQueue(with: MPMediaItemCollection(items: [media]))
        player.play()
    }
}





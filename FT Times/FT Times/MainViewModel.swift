//
//  MainViewModel.swift
//  FT Times
//
//  Created by NomoteteS on 26.02.2023.
//

import Foundation
import AVKit

class MainViewModel: ObservableObject {
    @Published var isActiveInterstitialAd : Bool
    @Published var isActiveRewardAd : Bool
    @Published var isAppReady: Bool
    @Published var isUserPressToMainButton: Bool
    
    @Published var isActiveButton1: Bool
    @Published var isActiveButton2: Bool
    @Published var isActiveButton3: Bool
    @Published var isActiveButton4: Bool
    
    @Published var text : String
    
    init(isActiveInterstitialAd: Bool = false,
         isActiveRewardAd: Bool = false,
         isAppReady: Bool = false,
         isUserPressToMainButton: Bool = false,
         isActiveButton1: Bool = false,
         isActiveButton2: Bool = false,
         isActiveButton3: Bool = false,
         isActiveButton4: Bool = false,
         text: String = "1-1") {
        self.isActiveInterstitialAd = isActiveInterstitialAd
        self.isActiveRewardAd = isActiveRewardAd
        self.isAppReady = isAppReady
        self.isUserPressToMainButton = isUserPressToMainButton
        self.isActiveButton1 = isActiveButton1
        self.isActiveButton2 = isActiveButton2
        self.isActiveButton3 = isActiveButton3
        self.isActiveButton4 = isActiveButton4
        self.text = text
    }
    
    func startAd() {
        self.isActiveInterstitialAd = true
        
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            if self.isActiveInterstitialAd {
                self.isUserPressToMainButton.toggle()
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
            self.isActiveRewardAd.toggle()
        }
    }
    
    func startSound() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
            Media11.share.playMedia(volume: 1)
            Media12.share.playMedia(volume: 0)
            Media12.share.playMedia(volume: 0)
            Media22.share.playMedia(volume: 0)
        }
    }
    
    func setSound(Media1: Float, Media2: Float, Media3: Float, Media4: Float) {
        Media11.share.player?.volume = Media1
        Media12.share.player?.volume = Media2
        Media21.share.player?.volume = Media3
        Media22.share.player?.volume = Media4
    }
    
    func seekSound() {
        Media11.share.player?.currentTime = 100.0
    }
    
    func actionButtons(Button1: Bool, Button2: Bool, Button3: Bool, Button4: Bool) {
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            self.isActiveButton1 = Button1
            self.isActiveButton2 = Button2
            self.isActiveButton3 = Button3
            self.isActiveButton4 = Button4
        }
    }
}


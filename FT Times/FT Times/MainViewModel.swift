//
//  MainViewModel.swift
//  FT Times
//
//  Created by NomoteteS on 26.02.2023.
//

import Foundation

class MainViewModel: ObservableObject {
    @Published var isActiveInterstitialAd : Bool
    @Published var isActiveRewardAd : Bool
    @Published var isAppReady: Bool
    @Published var isUserSkipToAd: Bool
    @Published var isOtherButtonsReady: Bool
    
    @Published var isButtonColored1: Bool
    @Published var isButtonColored2: Bool
    @Published var isButtonColored3: Bool
    @Published var isButtonColored4: Bool
    
    init(isActiveInterstitialAd: Bool = false,
         isActiveRewardAd: Bool = false,
         isAppReady: Bool = false,
         isUserSkipToAd: Bool = false,
         isOtherButtonsReady: Bool = true,
         isButtonColored1: Bool = false,
         isButtonColored2: Bool = false,
         isButtonColored3: Bool = false,
         isButtonColored4: Bool = false) {
        self.isActiveInterstitialAd = isActiveInterstitialAd
        self.isActiveRewardAd = isActiveRewardAd
        self.isAppReady = isAppReady
        self.isUserSkipToAd = isUserSkipToAd
        self.isOtherButtonsReady = isOtherButtonsReady
        self.isButtonColored1 = isButtonColored1
        self.isButtonColored2 = isButtonColored2
        self.isButtonColored3 = isButtonColored3
        self.isButtonColored4 = isButtonColored4
    }
    
    func ReadyApp() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.isAppReady = true
            print("APP IS READY")
        }
    }
    
    func startInterstitialAd() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
            self.isActiveInterstitialAd.toggle()
            self.isOtherButtonsReady.toggle()
        }
    }
    
    func playAudio() {
        
    }
    
    func againColorButton(Button1: Bool, Button2: Bool, Button3: Bool, Button4: Bool) {
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            self.isButtonColored1 = Button1
            self.isButtonColored2 = Button2
            self.isButtonColored3 = Button3
            self.isButtonColored4 = Button4
        }
    }
}


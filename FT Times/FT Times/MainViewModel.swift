//
//  MainViewModel.swift
//  FT Times
//
//  Created by NomoteteS on 26.02.2023.
//

import Foundation

class MainViewModel: ObservableObject {
    
    @Published var isStartPrimaryButton : Bool
    @Published var isThatActive : Bool
    @Published var isActiveInterstitialAd : Bool
    @Published var isActiveRewardAd : Bool
    @Published var network = NetworkManager()
    
    init(isStartPrimaryButton : Bool = false,
         isThatActive : Bool = false,
         isActiveInterstitialAd : Bool = false ,
         isActiveRewardAd : Bool = false,
         network : NetworkManager = .networkManager) {
        self.isStartPrimaryButton = isStartPrimaryButton
        self.isThatActive = isThatActive
        self.isActiveInterstitialAd = isActiveInterstitialAd
        self.isActiveRewardAd = isActiveRewardAd
        self.network = network
    }
    
    func startRewardAd() {
        self.isActiveRewardAd = true
    }
    
    func startInterstitialAd() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            self.isActiveInterstitialAd = true
            self.isThatActive = true
        }
    }
}


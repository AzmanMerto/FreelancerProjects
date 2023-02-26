//
//  MainView.swift
//  FT Times
//
//  Created by NomoteteS on 24.02.2023.
//

import SwiftUI

struct MainView: View {
    
    @ObservedObject var viewModel : MainViewModel = .init()
  
    var body: some View {
        ZStack {
            Color.blue
                .ignoresSafeArea()
            VStack(spacing: 20) {
                
                Spacer()
                
                Image("icon")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 100)
                    .padding(.bottom)
                
                // MARK: Start Button
                OpenOtherButton(active: {
                    viewModel.startRewardAd()
                    
                }, isActive: $viewModel.isThatActive)
                    
                // MARK: Description
                Text("Pooka respawn oldugunda pooka süresi alabilirsiniz.")
                    .foregroundColor(.white)
                    .font(.system(.subheadline, weight: .black))
                    .padding(.horizontal)
                    .multilineTextAlignment(.center)
                
                // MARK: Active Sound Buttons
                VStack(spacing: 20) {
                    PookaTakeTimeButton(action: {
                        
                    },
                                        text: "POOKA SÜRE AL",
                                        isActive: $viewModel.isThatActive)
                    HStack {
                        
                        VStack(spacing: 20) {
                            TimerButton(action: {
                                
                            },
                                        text: "SAYAÇ 1-2",
                                        isDeactive: .constant(false),
                                        isActive: $viewModel.isThatActive)
                            
                            TimerButton(action: {
                                
                            },
                                        text: "SAYAÇ 1-1",
                                        isDeactive: .constant(false),
                                        isActive: $viewModel.isThatActive)
                        }
                        
                        VStack(spacing: 20) {
                            // MARK: - 2 - 2
                            TimerButton(action: {
                                SoundManager().playSound(sound: .media11)
                                SoundManager().player?.volume = 1
                            },
                                        text: "SAYAÇ 2-2",
                                        isDeactive: .constant(false),
                                        isActive: $viewModel.isThatActive)
                            
                            // MARK: - 2 - 1
                            TimerButton(action: {
                                
                            },
                                        text: "SAYAÇ 2-1",
                                        isDeactive: .constant(false),
                                        isActive: $viewModel.isThatActive)
                         
                        }
                    }
                }
                .disabled(viewModel.isThatActive != true)
                
                // MARK: Web link
                Link(destination: URL(string: "https://ahmeters.blogspot.com/2022/04/fttimes-knight-online.html")!) {
                    HStack {
                        Text("Kullanım kılavuzu")
                        Image(systemName: "book.circle")
                    }
                    .foregroundColor(.white)
                    .font(.system(.subheadline, weight: .black))
                    .padding(.horizontal)
                    .multilineTextAlignment(.center)
                }
                Spacer()
                BannerAd(adUnitId: MobileAdsID.BannerId)
            }
        }
        // MARK: - Interstitial Ad
        .presentInterstitialAd(isPresented: $viewModel.isActiveInterstitialAd,
                               adUnitId: MobileAdsID.InterstitialId)
        // MARK: - Rewarded Ad
        .presentRewardedAd(isPresented: $viewModel.isActiveRewardAd, adUnitId: MobileAdsID.RewardedId) {
            print("Reward Granted")
            if viewModel.isActiveRewardAd {
                viewModel.startInterstitialAd()
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}



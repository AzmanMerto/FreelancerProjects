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
                
                OpenOtherButton(string: "", action: {
                    viewModel.isActiveRewardAd.toggle()
                })
                
                // MARK: Description
                Text("Pooka respawn oldugunda pooka \nsüresi alabilirsiniz.")
                    .foregroundColor(.white)
                    .scaledToFill()
                    .font(.system(.subheadline,
                                  weight: .black))
                    .padding(.horizontal)
                    .multilineTextAlignment(.center)
                // MARK: Active Sound Buttons
                VStack(spacing: 10) {
                    PookaTakeTimeButton()
                    HStack {
                        
                        VStack(spacing: 20) {
                            TimerButton(text: "Sayaç 1-2",
                                        isThatChanged: $viewModel.isButtonColored2) {
                                viewModel.againColorButton(Button1: false,
                                                           Button2: true,
                                                           Button3: false,
                                                           Button4: false)
                            }
                            
                            TimerButton(text: "Sayaç 1-1",
                                        isThatChanged: $viewModel.isButtonColored1) {
                                viewModel.againColorButton(Button1: true,
                                                           Button2: false,
                                                           Button3: false,
                                                           Button4: false)
                            }
                            
                            SecJumpButton(text: "- ms", isActive: .constant(false)) {
                                
                            }
                        }
                        
                        VStack(spacing: 20) {
                            TimerButton(text: "Sayaç 2-2",
                                        isThatChanged: $viewModel.isButtonColored4) {
                                viewModel.againColorButton(Button1: false,
                                                           Button2: false,
                                                           Button3: false,
                                                           Button4: true)
                            }
                            
                            TimerButton(text: "Sayaç 2-1",
                                        isThatChanged: $viewModel.isButtonColored3 ) {
                                viewModel.againColorButton(Button1: false,
                                                           Button2: false,
                                                           Button3: true,
                                                           Button4: false)
                            }
                            
                            SecJumpButton(text: "+ ms", isActive: .constant(false)) {
                                
                            }
                        }
                    }
                }
                .opacity(viewModel.isOtherButtonsReady ? 0.6 : 1)
                
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
                .padding(.vertical)
                
                Spacer()
                
                BannerAd(adUnitId: MobileAdsID.BannerId)
            }
        }
        // MARK: - Interstitial Ad
        .presentInterstitialAd(isPresented: $viewModel.isActiveInterstitialAd,
                               adUnitId: MobileAdsID.InterstitialId)
        // MARK: - Rewarded Ad
        .presentRewardedAd(isPresented: $viewModel.isActiveRewardAd, adUnitId: MobileAdsID.RewardedId) {
            viewModel.startInterstitialAd()
        }
        .onAppear{
            viewModel.ReadyApp()
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}



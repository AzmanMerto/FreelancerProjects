//
//  MainView.swift
//  FT Times
//
//  Created by NomoteteS on 24.02.2023.
//

import SwiftUI

struct MainView: View {
    
    @ObservedObject var viewModel : MainViewModel = .init()
    @State var isWaiting = true
    
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
                
                OpenOtherButton(isPressed: $viewModel.isUserPressToMainButton,
                                text: $viewModel.text,
                                action: {
                        viewModel.startAd()
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
                    PookaTakeTimeButton {
                        
                    }

                    HStack {
                        VStack(spacing: 20) {
                            TimerButton(text: "Sayaç 1-2",
                                        isThatChanged: $viewModel.isActiveButton2) {
                                viewModel.actionButtons(Button1: false,
                                                           Button2: true,
                                                           Button3: false,
                                                           Button4: false)
                                viewModel.text = "1-2"
                                viewModel.setSound(Media1: 0,
                                                   Media2: 1,
                                                   Media3: 0,
                                                   Media4: 0)
                            }
                            
                            TimerButton(text: "Sayaç 1-1",
                                        isThatChanged: $viewModel.isActiveButton1) {
                                viewModel.actionButtons(Button1: true,
                                                           Button2: false,
                                                           Button3: false,
                                                           Button4: false)
                                viewModel.text = "1-1"
                                viewModel.setSound(Media1: 1,
                                                   Media2: 0,
                                                   Media3: 0,
                                                   Media4: 0)
                            }
                            
                            SecJumpButton(text: "- ms") {
                                    
                            }
                        }
                        
                        VStack(spacing: 20) {
                            TimerButton(text: "Sayaç 2-2",
                                        isThatChanged: $viewModel.isActiveButton4) {
                                viewModel.actionButtons(Button1: false,
                                                           Button2: false,
                                                           Button3: false,
                                                           Button4: true)
                                viewModel.text = "2-2"
                                viewModel.setSound(Media1: 0,
                                                   Media2: 0,
                                                   Media3: 0,
                                                   Media4: 1)
                            }
                            
                            TimerButton(text: "Sayaç 2-1",
                                        isThatChanged: $viewModel.isActiveButton3 ) {
                                viewModel.actionButtons(Button1: false,
                                                           Button2: false,
                                                           Button3: true,
                                                           Button4: false)
                                viewModel.text = "2-1"
                                viewModel.setSound(Media1: 0,
                                                   Media2: 0,
                                                   Media3: 1,
                                                   Media4: 0)
                            }
                            
                            SecJumpButton(text: "+ ms") {
                                
                            }
                        }
                    }
                }
                .disabled(viewModel.isAppReady != true)
                .opacity(viewModel.isAppReady ? 1 : 0.6)
                
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
        .disabled(isWaiting)
        .onAppear{
            DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                isWaiting.toggle()
            }
        }
        // MARK: - Interstitial Ad
        .presentInterstitialAd(isPresented: $viewModel.isActiveInterstitialAd,
                               adUnitId: MobileAdsID.InterstitialId)
        // MARK: - Rewarded Ad
        .presentRewardedAd(isPresented: $viewModel.isActiveRewardAd, adUnitId: MobileAdsID.RewardedId) {
            viewModel.isAppReady = true
            viewModel.startSound()
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}



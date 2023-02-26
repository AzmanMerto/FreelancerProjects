//
//  MainView.swift
//  FT Times
//
//  Created by NomoteteS on 24.02.2023.
//

import SwiftUI

struct MainView: View {
    
    @State var isThatActive : Bool = false
    @State var isActiveAd = false
    
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
               OpenOtherButton(isActive: $isThatActive)
                    
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
                                        isActive: $isThatActive)
                    HStack {
                        
                        VStack(spacing: 20) {
                            TimerButton(action: {
                                
                            },
                                        text: "SAYAÇ 1-2",
                                        isDeactive: .constant(false),
                                        isActive: $isThatActive)
                            
                            TimerButton(action: {
                                
                            },
                                        text: "SAYAÇ 1-1",
                                        isDeactive: .constant(false),
                                        isActive: $isThatActive)
                        }
                        
                        VStack(spacing: 20) {
                            // MARK: - 2 - 2
                            TimerButton(action: {
                                SoundManager().playSound(sound: .media11)
                                SoundManager().player?.volume = 1
                            },
                                        text: "SAYAÇ 2-2",
                                        isDeactive: .constant(false),
                                        isActive: $isThatActive)
                            
                            // MARK: - 2 - 1
                            TimerButton(action: {
                                
                            },
                                        text: "SAYAÇ 2-1",
                                        isDeactive: .constant(false),
                                        isActive: $isThatActive)
                         
                        }
                    }
                }
                .disabled(isThatActive != true)
                
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
            .presentInterstitialAd(isPresented: $isActiveAd,
                                   adUnitId: MobileAdsID.InterstitialId)
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

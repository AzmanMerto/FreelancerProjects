//
//  MainPlayerView.swift
//  TOOF Audio
//
//  Created by NomoteteS on 23.04.2023.
//

import SwiftUI

struct MainPlayerView: View {
    
    @ObservedObject var viewModel: MainPlayerViewModel
    @State private var dragOffset = CGSize.zero

    var body: some View {
        ZStack {
            Color.ToofBackgroundPlayerColor.ignoresSafeArea()
            VStack {
                RoundedRectangle(cornerRadius: 10)
                    .frame(height: 5)
                    .padding(.horizontal,dw(0.43))
                    .foregroundColor(.ToofTextColor)
                    .padding(.top)
                Spacer()
                Image(ImageHelper.main.myMusic.rawValue)
                    .resizable()
                    .scaledToFit()
                    .frame(height: dh(0.4))
                Spacer()
                VStack {
                    PlayInterector(isRandom: $viewModel.isTapedRandom,
                                   rotateSection: viewModel.rotateSection,
                                   deviceName: viewModel.musicName)
                    HStack {
                        Text(viewModel.musicName)
                            .font(.default22).bold()
                            .foregroundColor(.ToofTextColor)
                        Spacer()
                    }
                    
                    PlayerButton(isPlaying: $viewModel.isPlaying)
                    
                    HStack {
                        Image(ImageHelper.player.playerSpearkerLow.rawValue)
                        Slider(value: .constant(0), in: 0...1){ _ in
                            
                        }
                        Image(ImageHelper.player.playerSpearkerHigh.rawValue)
                    }
                }
                .padding(.horizontal,dw(0.1))
                Spacer()
            }
        }
    }
}

struct MainPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        MainPlayerView(viewModel: .init())
    }
}



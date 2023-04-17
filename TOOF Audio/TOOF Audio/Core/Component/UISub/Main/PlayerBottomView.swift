//
//  PlayerBottomView.swift
//  TOOF Audio
//
//  Created by NomoteteS on 8.04.2023.
//

import SwiftUI

struct PlayerBottomView: View {
    
    @ObservedObject var viewModel: MainViewModel

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color.ToofTextColor)
                .overlay(content: {
                    //TODO: Fetch music
                    Color.ToofBackgroundPlayerColor
                        .cornerRadius(12)
                    HStack {
                        Image(ImageHelper.main.myMusic.rawValue)
                            .resizable()
                            .scaledToFit()
                            .frame(height: 54)
                        Text("Music Title")
                            .font(.boldRounded14)
                            .foregroundColor(.ToofTextColor)
                        Spacer()
                        Button {
                            //TODO: Play music
                        } label: {
                            Image(ImageHelper.player.playButton.rawValue)
                        }
                        .padding(.trailing)
                        Button {
                            //TODO: Next music
                        } label: {
                            Image(ImageHelper.player.forwardButton.rawValue)
                        }
                    }
                    .padding(.horizontal)
                })
                .frame(height: 67)
                .padding(.horizontal,40)
                .offset(CGSize(width: 0,height: UIScreen.main.bounds.height * 0.34))
                .onTapGesture {
                    viewModel.isOpenedPlayerView.toggle()
                }
        }
        .opacity(viewModel.isLogout ? 0 : 1)
        .sheet(isPresented: $viewModel.isOpenedPlayerView) {
            PlayerView(viewModel: PlayerViewModel(musicFiles: viewModel.musicFiles))
                .presentationDetents([.large])
        }
    }
}


struct PlayerBottomView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            PlayerBottomView(viewModel: .init())
        }
    }
}

//
//  PlayerButton.swift
//  TOOF Audio
//
//  Created by NomoteteS on 23.04.2023.
//

import SwiftUI

struct PlayerButton: View {
    
    @Binding var isPlaying: Bool
    
    var body: some View {
        HStack(spacing: dw(0.2)) {
            //MARK: PlayerButton - Previous
            Button {
                //TODO: Previous
            } label: {
                Image(ImageHelper.player.backButton.rawValue)
            }
            //MARK: PlayerButton - Play/Pause
            Button {
                //TODO: Play
                withAnimation {
                    isPlaying.toggle()
                }
            } label: {
                Image(isPlaying ? ImageHelper.player.playButton.rawValue : ImageHelper.player.pauseButton.rawValue)
                    .resizable()
                    .scaledToFit()
                    .frame(width: dw(0.1))
            }
            //MARK: PlayerButton - Next
            Button {
                //TODO: Next
            } label: {
                Image(ImageHelper.player.forwardButton.rawValue)
            }
        }
        .frame(height: dh(0.1))
    }
}

struct PlayerButton_Previews: PreviewProvider {
    static var previews: some View {
        PlayerButton(isPlaying: .constant(false))
    }
}

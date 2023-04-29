//
//  TabPlayerItems.swift
//  TOOF Audio
//
//  Created by NomoteteS on 23.04.2023.
//

import SwiftUI

struct TabPlayerItems: View {
    
    @Binding var isPlaying: Bool
    @State var musicName: String
    
    var body: some View {
        HStack {
            HStack {
                //MARK: TabPlayerButton - Image
                Image(ImageHelper.main.myMusic.rawValue)
                    .resizable()
                    .scaledToFit()
                    .padding(.all,8)
                //MARK: TabPlayerButton - Music Name
                Text(musicName)
                    .font(.default17)
                    .fontWeight(.light)
                    .lineLimit(2)
                    .foregroundColor(.ToofTextColor)
            }
            Spacer()
            //MARK: TabPlayerButton - Play/Pause
            Button {
                //TODO: Tab Play
                withAnimation {
                    isPlaying.toggle()
                }
            } label: {
                Image(isPlaying ? ImageHelper.player.playButton.rawValue : ImageHelper.player.pauseButton.rawValue)
                    .resizable()
                    .scaledToFit()
                    .frame(width: dw(0.06))
            }
            .padding(.trailing)
            //MARK: TabPlayerButton - Next
            Button {
                //TODO: Tab Next
            } label: {
                Image(ImageHelper.player.forwardButton.rawValue)
            }
        }
    }
}

struct TabPlayerItems_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.ToofBackgroundColor.ignoresSafeArea()
            TabPlayerItems(isPlaying: .constant(false),musicName: "asldkas")
        }
    }
}

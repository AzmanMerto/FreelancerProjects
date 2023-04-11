//
//  PlayerView.swift
//  TOOF Audio
//
//  Created by NomoteteS on 1.04.2023.
//

import SwiftUI

struct PlayerView: View {
    
    @ObservedObject var viewModel: MainViewModel
    @State var section = 1
    
    var body: some View {
        ZStack {
            Color.ToofBackgroundPlayerColor
                .ignoresSafeArea()
            VStack {
                VStack(alignment: .center, spacing: 50) {
                    //MARK: PlayerView - Music Image
                    Image(ImageHelper.main.myMusic.rawValue)
                        .resizable()
                        .scaledToFit()
                        .padding(EdgeInsets(top: 50, leading: 50, bottom: 50, trailing: 50))
                        .cornerRadius(20)
                    //MARK: PlayerView - Header
                    VStack {
                        HStack {
                            //TODO: Device fetch here
                            //MARK: PlayerView - Device
                            Text("Cihaz: Device")
                                .font(.boldDefault18)
                                .foregroundColor(.ToofTextSoftColor)
                                .padding(.horizontal,5)
                                .background(Color.ToofPrimaryColor.cornerRadius(5))
                            Spacer()
                            //MARK: PlayerView - Random Button
                            Image(viewModel.isRandomActive ? ImageHelper.player.randomIconFilled.rawValue : ImageHelper.player.randomIcon.rawValue)
                                .background {
                                    RoundedRectangle(cornerRadius: 5)
                                        .foregroundColor(.ToofTextSoftColor)
                                        .padding(.all,-4)
                                        .opacity(0.5)
                                }
                                .onTapGesture {
                                    viewModel.isRandomActive.toggle()
                                    //TODO: Random music list
                                }
                                .padding(.trailing)
                            //MARK: PlayerView - Rotate Button
                            Image("Rotate\(section)")
                                .background {
                                    RoundedRectangle(cornerRadius: 5)
                                        .foregroundColor(.ToofTextSoftColor)
                                        .padding(.all,-4)
                                        .opacity(0.5)
                                }
                                .onTapGesture {
                                    section = (section % 3) + 1
                                    //TODO: Repate music list
                                }
                        }
                        //TODO: Fetch music values
                        PayerViewMusicInformation(viewModel: viewModel)
                            .disabled(viewModel.music.audioPlayer == nil)
                    }
                    //MARK: PlayerView - Buttons
                    PayerViewButtons(viewModel: viewModel)
                        .disabled(viewModel.music.audioPlayer == nil)
                    //MARK: PlayerView - Volume
                    HStack {
                        Image(ImageHelper.player.playerSpearkerLow.rawValue)
                        Slider(value: $viewModel.music.volume, in: 0...1){ _ in
                            viewModel.music.audioPlayer?.volume = viewModel.music.volume
                        }
                        Image(ImageHelper.player.playerSpearkerHigh.rawValue)
                    }
                }
                .padding(.horizontal,40)
            }
            .onAppear{
                UISlider.appearance().tintColor = UIColor(Color.ToofButtonColor)
            }
        }
    }
}

struct PlayerView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerView(viewModel: .init())
    }
}

struct PayerViewMusicInformation: View {
    
    @ObservedObject var viewModel: MainViewModel
    
    var body: some View {
        VStack(spacing: 0) {
            //MARK: PlayerView - Music Info
            HStack {
                if let musicDetail = viewModel.music.currentlyPlayingURL {
                    VStack(alignment: .leading) {
                        Text(musicDetail.lastPathComponent)
                            .font(.boldDefault25)
                            .foregroundColor(.ToofTextColor)
                        Text("")
                            .font(.boldRounded14)
                            .foregroundColor(.ToofTextSoftColor)
                    }
                }else {
                    VStack(alignment: .leading) {
                        Text("Music Title")
                            .font(.boldDefault25)
                            .foregroundColor(.ToofTextColor)
                        Text("Music Artist")
                            .font(.boldRounded14)
                            .foregroundColor(.ToofTextSoftColor)
                    }
                }
                Spacer()
            }
            
            Slider(value: $viewModel.currentTime, in: 0...viewModel.music.duration) { _ in

            }
                .tint(.ToofButtonColor)
            HStack {
                Text("\(viewModel.music.timeString(from: viewModel.music.audioPlayer?.currentTime ?? 0))")
                Spacer()
                Text("\(viewModel.music.timeString(from: viewModel.music.duration))")
            }
            .foregroundColor(.ToofTextSoftColor)
            .font(.reguDefault12)
            
            .padding(.horizontal,-15)
        }
    }
}

struct PayerViewButtons: View {
    
    @ObservedObject var viewModel: MainViewModel
    @State var isPlaying = false
    
    var body: some View {
        
        HStack(spacing: 60) {
            // Previous
            Button {
                viewModel.music.previous(musicFiles: viewModel.musicFiles)
            } label: {
                Image(ImageHelper.player.backButton.rawValue)
            }
            // Play/Pause
            Button {
                withAnimation {
                    self.isPlaying.toggle()
                    viewModel.music.playPause(isPlaying: self.isPlaying)
                }
            } label: {
                Image(self.isPlaying ? ImageHelper.player.playButton.rawValue : ImageHelper.player.pauseButton.rawValue)
            }
            // Next
            Button {
                viewModel.music.next(musicFiles: viewModel.musicFiles)
            } label: {
                Image(ImageHelper.player.forwardButton.rawValue)
            }
        }
    }
}

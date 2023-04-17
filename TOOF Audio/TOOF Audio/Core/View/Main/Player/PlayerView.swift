//
//  PlayerView.swift
//  TOOF Audio
//
//  Created by NomoteteS on 1.04.2023.
//

import SwiftUI

struct PlayerView: View {
    
    @StateObject var viewModel: PlayerViewModel
    
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
                            Image(viewModel.isRandomPlaying ? ImageHelper.player.randomIconFilled.rawValue : ImageHelper.player.randomIcon.rawValue)
                                .background {
                                    RoundedRectangle(cornerRadius: 5)
                                        .foregroundColor(.ToofTextSoftColor)
                                        .padding(.all,-4)
                                        .opacity(0.5)
                                }
                                .onTapGesture {
                                    viewModel.isRandomPlaying.toggle()
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
                        VStack(spacing: 0) {
                            //MARK: PlayerView - Music Info
                            HStack {
                                if let musicDetail = viewModel.musicPlayer.currentURLPlaying {
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
                        }
                        Slider(value: $viewModel.currenTime, in: 0...(viewModel.musicPlayer.duration)) { _ in
//                            musicPlayer.audioPlayer?.currentTime = viewModel.currenTime
                        }
                        .tint(.ToofButtonColor)
                        HStack {
//                            Text("\(viewModel.musicPlayer.timeString(from: musicPlayer.audioPlayer?.currentTime ?? 0))")
                            Spacer()
                            Text("\(viewModel.musicPlayer.timeString(from: viewModel.musicPlayer.duration))")
                        }
                        .foregroundColor(.ToofTextSoftColor)
                        .font(.reguDefault12)
                        
                        .padding(.horizontal,-15)
                    }
                    .disabled(viewModel.musicPlayer.audioPlayer == nil)
                    //MARK: PlayerView - Buttons
                    HStack(spacing: 60) {
                        // Previous
                        Button {
                            viewModel.musicPlayer.previous(musicFiles: viewModel.musicFiles)
                        } label: {
                            Image(ImageHelper.player.backButton.rawValue)
                        }
                        // Play/Pause
                        Button {
                            withAnimation {
                                viewModel.isPlaying.toggle()
                                viewModel.musicPlayer.playAndStop(isPlaying: viewModel.isPlaying)
                            }
                        } label: {
                            Image(viewModel.isPlaying ? ImageHelper.player.playButton.rawValue : ImageHelper.player.pauseButton.rawValue)
                        }
                        // Next
                        Button {
                            //viewModel.music.next(musicFiles: viewModel.musicFiles)
                        } label: {
                            Image(ImageHelper.player.forwardButton.rawValue)
                        }
                    }
                    .disabled(viewModel.musicPlayer.audioPlayer == nil)
                    //MARK: PlayerView - Volume
                    HStack {
                        Image(ImageHelper.player.playerSpearkerLow.rawValue)
                        Slider(value: $viewModel.volume, in: 0...1){ _ in
                            viewModel.musicPlayer.audioPlayer?.volume = viewModel.volume
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
        PlayerView(viewModel: .init(musicFiles: []))
    }
}


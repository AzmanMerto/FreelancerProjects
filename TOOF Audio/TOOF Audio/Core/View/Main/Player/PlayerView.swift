//
//  PlayerView.swift
//  TOOF Audio
//
//  Created by NomoteteS on 1.04.2023.
//

import SwiftUI

struct PlayerView: View {
    
    @ObservedObject var viewModel: MainViewModel = .init()
    @State var section = 1
    
    var body: some View {
        ZStack {
            Color.ToofBackgroundPlayerColor
                .ignoresSafeArea()
            VStack {
                VStack(alignment: .center, spacing: 50) {
                    //TODO: Music image fetch here
                    //MARK: PlayerView - Music Image
                    Image(ImageHelper.main.myMusic.rawValue)
                        .resizable()
                        .scaledToFit()
                        .padding(EdgeInsets(top: 50, leading: 50, bottom: 0, trailing: 50))
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
                        VStack(spacing: 0) {
                            //MARK: PlayerView - Music Info
                            HStack {
                                VStack(alignment: .leading) {
                                    Text("Music Title")
                                        .font(.boldDefault25)
                                        .foregroundColor(.ToofTextColor)
                                    Text("Music Artist")
                                        .font(.boldRounded14)
                                        .foregroundColor(.ToofTextSoftColor)
                                }
                                Spacer()
                            }
                            Slider(value: .constant(50), in: 0...100)
                                .tint(.ToofButtonColor)
                            HStack {
                                Text("0.00")
                                    .font(.reguDefault12)
                                Spacer()
                                Text("1.00")
                                    .font(.reguDefault12)
                            }
                            .padding(.horizontal,-15)
                        }
                    }
                    //MARK: PlayerView - Buttons
                    HStack(spacing: 60) {
                        Image(ImageHelper.player.backButton.rawValue)
                        Image(ImageHelper.player.playButton.rawValue)
                        Image(ImageHelper.player.forwardButton.rawValue)
                    }
                    //MARK: PlayerView - Volume
                    HStack {
                        Image(ImageHelper.player.playerSpearkerLow.rawValue)
                        Slider(value: .constant(50), in: 0...100)
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
        PlayerView()
    }
}

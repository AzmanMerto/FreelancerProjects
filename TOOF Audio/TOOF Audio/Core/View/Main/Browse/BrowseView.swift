//
//  BrowseView.swift
//  TOOF Audio
//
//  Created by NomoteteS on 29.03.2023.
//

import SwiftUI

struct BrowseView: View {
    
    @ObservedObject var viewModel: MainViewModel
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.ToofBackgroundColor
                    .ignoresSafeArea()
                VStack {
                    //MARK: BrowseView - Header
                    MainTitleAndBack(title: TextHelper.main.mainBrowseTitle.rawValue)
                        .padding(.bottom,30)
                    //MARK: BrowseView - Connect Sections
                    HStack {
                        //TODO: Change connect ID 
                        ForEach(viewModel.connectModelItems, id: \.connectInt) { connect in
                            let connectStatus = (connect.connectInt == viewModel.connectInt)
                            ZStack {
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(connectStatus ? Color.ToofTextColor : Color.ToofTextSoftColor)
                                    .frame(height: 40)
                                Text(connect.connectName)
                                    .foregroundColor(connectStatus ? .ToofTextColor : .ToofTextSoftColor)
                            }
                            .onTapGesture {
                                viewModel.connectInt = connect.connectInt
                            }
                        }
                    }
                    .padding(.horizontal)
                    Rectangle()
                        .frame(height: 1)
                        .padding(.horizontal)
                        .foregroundColor(.ToofTextColor)
                        .foregroundColor(.ToofTextColor)
                    //MARK: BrowseView - Music Service
                    VStack(alignment: .leading) {
                        Text(TextHelper.main.mainBrowseMusicService.rawValue.locale())
                            .font(.semiDefault20.bold())
                            .foregroundColor(.ToofTextColor)
                        ScrollView(.horizontal) {
                            HStack {
                                ForEach(viewModel.musicServicesModelItems, id: \.imageString) { services in
                                    Button {
                                        switch services {
                                        case MusicServicesModel(imageString: ImageHelper.main.serviceAmazon.rawValue):
                                            if let url = URL(string: "amzn://music"), UIApplication.shared.canOpenURL(url) {
                                                UIApplication.shared.open(url, options: [:], completionHandler: nil)
                                            } else {
                                                print("Unable to open Amazon Music app.")
                                            }
                                        case MusicServicesModel(imageString:ImageHelper.main.serviceDeezer.rawValue):
                                            if let url = URL(string: "deezer://"), UIApplication.shared.canOpenURL(url) {
                                                UIApplication.shared.open(url, options: [:], completionHandler: nil)
                                            } else {
                                                print("Deezer uygulaması açılamadı.")
                                            }
                                        case MusicServicesModel(imageString:ImageHelper.main.serviceSpotify.rawValue):
                                            if let url = URL(string: "spotify://"), UIApplication.shared.canOpenURL(url) {
                                                UIApplication.shared.open(url, options: [:], completionHandler: nil)
                                            } else {
                                                print("Spotify uygulaması açılamadı.")
                                            }
                                        case MusicServicesModel(imageString:ImageHelper.main.serviceTidal.rawValue):
                                            if let url = URL(string: "tidal://"), UIApplication.shared.canOpenURL(url) {
                                                UIApplication.shared.open(url, options: [:], completionHandler: nil)
                                            } else {
                                                print("Tidal uygulaması açılamadı.")
                                            }
                                        default:
                                            break
                                        }   } label: {
                                        ZStack {
                                            RoundedRectangle(cornerRadius: 10)
                                                .foregroundColor(.ToofTextSoftColor)
                                                .scaledToFit()
                                                .frame(width: 70)
                                            Image(services.imageString)
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: 50)
                                        }
                                    }
                                }
                            }
                        }
                    }
                    .padding(.all)
                    Rectangle()
                        .frame(height: 1)
                        .padding(.horizontal)
                        .foregroundColor(.ToofTextColor)
                    //MARK: BrowseView - My Library
                    Text(TextHelper.main.mainBrowseMyLibrary.rawValue.locale())
                        .font(.semiDefault20)
                        .foregroundColor(.ToofTextColor)
                    NavigationLink {
                        MyMusicView(viewModel: viewModel)
                            .navigationBarBackButtonHidden(true)
                    } label: {
                        HStack(spacing: 20) {
                            Image(ImageHelper.main.myMusic.rawValue)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 70)
                            
                            Text(TextHelper.main.mainBrowseMyMusic.rawValue.locale())
                                .font(.reRounded16)
                                .foregroundColor(.ToofTextColor)
                            Spacer()
                        }
                    }
                    .padding(.leading)
                    Spacer()
                }
            }
        }
    }
}

struct BrowseView_Previews: PreviewProvider {
    static var previews: some View {
        BrowseView(viewModel: .init())
    }
}



//
//  musicServiceList.swift
//  TOOF Audio
//
//  Created by NomoteteS on 21.04.2023.
//

import SwiftUI

struct musicServiceList: View {
    
    @ObservedObject var viewModel: MainBrowseViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            line()
            Text(TextHelper.main.mainBrowseMusicService.rawValue.locale())
                .font(.default20.bold())
                .foregroundColor(.ToofTextColor)
            ScrollView(.horizontal) {
                //TODO: Play with do on service
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
            line()
        }
    }
}

struct musicServiceList_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.ToofBackgroundColor.ignoresSafeArea()
            musicServiceList(viewModel: .init())
        }
    }
}

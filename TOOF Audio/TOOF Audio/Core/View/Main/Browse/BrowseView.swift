//
//  BrowseView.swift
//  TOOF Audio
//
//  Created by NomoteteS on 29.03.2023.
//

import SwiftUI

struct BrowseView: View {
    
    @ObservedObject var viewModel: MainViewModel = .init()
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.ToofBackgroundColor
                    .ignoresSafeArea()
                VStack {
                    //MARK: BrowseView - Header
                    MainTitleAndBack(title: TextHelper.main.mainBrowseTitle.rawValue)
                        .padding(.vertical,30)
                    //MARK: BrowseView - Connect Sections
                    HStack {
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
                    Divider()
                        .foregroundColor(.ToofTextColor)
                    //MARK: BrowseView - Music Service
                    Text(TextHelper.main.mainBrowseMusicService.rawValue.locale())
                        .font(.semiDefault20)
                        .foregroundColor(.ToofTextColor)
                    ScrollView(.vertical, showsIndicators: false) {
                        ForEach(viewModel.musicServicesModelItems, id: \.imageString) { services in
                            ZStack {
                                RoundedRectangle(cornerRadius: 10)
                                    .foregroundColor(.ToofTextSoftColor)
                                Image(services.imageString)
                            }
                            .scaledToFit()
                            .frame(width: 70)
                        }
                    }
                    Divider()
                        .foregroundColor(.ToofTextColor)
                    //MARK: BrowseView - My Library
                    Text(TextHelper.main.mainBrowseMyLibrary.rawValue.locale())
                        .font(.semiDefault20)
                        .foregroundColor(.ToofTextColor)
                    NavigationLink {
                        MyMusicView()
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
                    Spacer()
                }
            }
        }
    }
}

struct BrowseView_Previews: PreviewProvider {
    static var previews: some View {
        BrowseView()
    }
}



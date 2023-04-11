//
//  MyMusicView.swift
//  TOOF Audio
//
//  Created by NomoteteS on 30.03.2023.
//

import SwiftUI

struct MyMusicView: View {
    
    @ObservedObject var viewModel: MainViewModel
    
    var body: some View {
        ZStack {
            Color.ToofBackgroundColor
                .ignoresSafeArea()
            VStack{
                //MARK: MyMusicView - Header
                MainTitleAndBack(isBackButtonShowing: true, title: TextHelper.main.mainBrowseMyMusic.rawValue)
                    .padding(.bottom,30)
                //MARK: MyMusicView - List
                List {
                    ForEach(viewModel.filteredMusicFiles.keys.sorted(), id: \.self) { key in
                        Section(header: Text(key)) {
                            ForEach(viewModel.filteredMusicFiles[key]!, id: \.self) { musicFile in
                                HStack {
                                    Button(action: {
                                        MusicPlayer.shared.startAudioPlayer(url: musicFile)
                                    }) {
                                        Text(musicFile.lastPathComponent)
                                    }
                                    Spacer()
                                }
                            }
                        }
                    }
                    .onDelete(perform:viewModel.deleteMusicFiles)
                    .listRowBackground(Color.clear)
                    .tint(.white)
                }
                .scrollContentBackground(.hidden)
                .background(Color.ToofBackgroundColor)
                .padding(.vertical)
                Spacer()
            }
            .onAppear{
                // Get saved/added musics
                viewModel.musicFiles = viewModel.fetchMusicFilesFromDocuments()
            }
        }
    }
}

struct MyMusicView_Previews: PreviewProvider {
    static var previews: some View {
        MyMusicView(viewModel: .init())
    }
}

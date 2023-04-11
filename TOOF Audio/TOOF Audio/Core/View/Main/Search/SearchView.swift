//
//  SearchView.swift
//  TOOF Audio
//
//  Created by NomoteteS on 29.03.2023.
//

import SwiftUI
import MediaPlayer
import AVFoundation

struct SearchView: View {
    
    @ObservedObject var viewModel: MainViewModel
    
    var body: some View {
        ZStack {
            Color.ToofBackgroundColor
                .ignoresSafeArea()
            VStack {
                //MARK: SearchView - Header
                ZStack {
                    MainTitleAndBack(title: TextHelper.main.mainSearchTitle.rawValue)
                        .padding(.bottom,30)
                    HStack {
                        //MARK: SearchView - Refresh button
                        Button {
                            viewModel.musicFiles = viewModel.fetchMusicFilesFromDocuments()
                        } label: {
                            Image(systemName: "arrow.clockwise")
                                .font(.boldDefault25)
                                .foregroundColor(.ToofButtonColor)
                        }
                        Spacer()
                        //MARK: SearchView - Add Music Button
                        Button {
                            viewModel.showDocumentPicker.toggle()
                        } label: {
                            Text("+")
                                .font(.boldDefault25)
                                .foregroundColor(.ToofButtonColor)
                        }
                        .sheet(isPresented: $viewModel.showDocumentPicker) {
                            DocumentPicker { urls in
                                viewModel.musicFiles.append(contentsOf: urls)
                            }
                        }
                    }
                    .padding(.horizontal)
                }
                SearchBar(searchText: $viewModel.searchBar)
                List {
                    ForEach(viewModel.musicFiles, id: \.self) { musicFile in
                        HStack {
                            Button(action: {
                                MusicPlayer.shared.play(url: musicFile)
                            }) {
                                Text(musicFile.lastPathComponent)
                            }
                        }
                    }
                    .onDelete(perform: viewModel.deleteMusicFiles)
                }
                Spacer()
            }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(viewModel: .init())
    }
}


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
                            viewModel.isShowDocumentPicker.toggle()
                        } label: {
                            Text("+")
                                .font(.boldDefault25)
                                .foregroundColor(.ToofButtonColor)
                        }
                        .sheet(isPresented: $viewModel.isShowDocumentPicker) {
                            DocumentPicker { urls in
                                viewModel.musicFiles.append(contentsOf: urls)
                            }
                        }
                    }
                    .padding(.horizontal)
                }
                //MARK: SearchView - SearchBar
                SearchBar(searchText: $viewModel.searchText)
                //MARK: SearchView - List
                List {
                    ForEach(viewModel.filteredMusicFiles.keys.sorted(), id: \.self) { key in
                        Section(header: Text(key)) {
                            ForEach(viewModel.filteredMusicFiles[key]!, id: \.self) { musicFile in
                                Button(action: {
                                    MusicPlayer.shared.startMusicPlayer(url: musicFile)
                                }) {
                                    HStack {
                                        Image(ImageHelper.main.listImages.rawValue)
                                        Text(musicFile.lastPathComponent)
                                        Spacer()
                                    }
                                }
                                .tint(Color(ColorHelper.textColor.rawValue))
                            }
                            .listRowBackground(Color.ToofBackgroundColor)
                        }
                    }
                    .onDelete(perform:viewModel.deleteMusicFiles)
                }
                .opacity( (viewModel.musicFiles.count > 0 && viewModel.filteredMusicFiles.keys.sorted().count > 0) ? 1 : 0 )
                .scrollContentBackground(.hidden)
                .background(Color.ToofBackgroundColor)
                .padding(.vertical)
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


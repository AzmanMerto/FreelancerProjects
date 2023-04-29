//
//  MainSearchView.swift
//  TOOF Audio
//
//  Created by NomoteteS on 20.04.2023.
//

import SwiftUI

struct MainSearchView: View {
    
    @ObservedObject var viewModel: MainSearchViewModel
    
    
    var body: some View {
        ZStack {
            Color.ToofBackgroundColor.ignoresSafeArea()
            VStack {
                Spacer()
                //MARK: MainSearchView - Header
                mainHeader(title: TextHelper.main.mainSearchTitle.rawValue)
                    .overlay(content: {
                        SearchTopButtons {
                            viewModel.musicFiles = viewModel.fetchMusicFilesFromDocuments()
                        } appleButton: {
                            
                        } addButton: {
                            viewModel.isShowDocumentPicker.toggle()
                        }
                    })
                    .padding(.top)
                //                Spacer()
                //MARK: MainSearchView - SearchBar
                SearchBar(searchText: $viewModel.searchText)
                Spacer()
                MusicList(viewModel: viewModel)
                    .frame(height: dh(0.55))
                Spacer()
            }
            .padding(.vertical)
            .sheet(isPresented: $viewModel.isShowDocumentPicker) {
                DocumentPicker { urls in
                    viewModel.musicFiles.append(contentsOf: urls)
                }
            }
        }
    }
}

struct MainSearchView_Previews: PreviewProvider {
    static var previews: some View {
        MainSearchView(viewModel: .init(musicFiles: [],
                                        currentPlayURL: URL(string: "")!))
    }
}

//
//  MainSearchView.swift
//  TOOF Audio
//
//  Created by NomoteteS on 29.04.2023.
//

import SwiftUI
import MediaPlayer

struct MainSearchView: View {
    
    @ObservedObject var viewModel: MainSearchViewModel
    @State var isBoolene = false
    var body: some View {
        ZStack {
            Color.ToofBackgroundColor.ignoresSafeArea()
            VStack {
                //MARK: MainSearchView - Header
                SearchTopButtons(isUserHaveAppleMusicSubs: $viewModel.isUserHaveAppleMusicSubs) {
                    viewModel.asyncData()
                } appleButton: {
                    viewModel.appleMusic.checkUserAppleMusicRequest()
                        isBoolene.toggle()
                } addButton: {
                    viewModel.isShowDocumentPicker.toggle()
                }
                SearchBar(searchText: $viewModel.searchText)
                MusicList(viewModel: viewModel)
                Spacer()
            }
            .padding(.vertical)
            .onAppear {
                viewModel.asyncData()
                viewModel.appleMusic.checkAppleMusicSubscription { userHaveSub in
                    if userHaveSub {
                        viewModel.isUserHaveAppleMusicSubs.toggle()
                    }
                }
            }
            .sheet(isPresented: $viewModel.isShowDocumentPicker) {
                DocumentPicker { urls in
                    viewModel.musicFiles.append(contentsOf: urls)
                }
            }
            .sheet(isPresented: $isBoolene) {
                MusicPicker(selectedMusic: $viewModel.musicFiles)
            }
        }
    }
}

struct MainSearchView_Previews: PreviewProvider {
    static var previews: some View {
        MainSearchView(viewModel: .init(musicFiles: [], currentPlayURL: URL(string: "")!))
    }
}

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
    
    @ObservedObject var viewModel: MainViewModel = .init()
    
    var body: some View {
        ZStack {
            Color.ToofBackgroundColor
                .ignoresSafeArea()
            VStack {
                MainTitleAndBack(title: TextHelper.main.mainSearchTitle.rawValue)
                    .padding(.bottom,30)
                SearchBar(searchText: $viewModel.searchBar)
                    //MARK: TEST -
 
                    //MARK: TEST -
                Spacer()
            }
            .onAppear(perform: {
                FetchSong.shared.requestPermission()
            })
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}


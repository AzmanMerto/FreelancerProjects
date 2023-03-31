//
//  SearchView.swift
//  TOOF Audio
//
//  Created by NomoteteS on 29.03.2023.
//

import SwiftUI
import MediaPlayer
import AVKit


struct SearchView: View {
    
    @ObservedObject var viewModel: MainViewModel = .init()
    
    func fetchSongs() -> [MPMediaItem] {
        let query = MPMediaQuery.songs()
        let predicate = MPMediaPropertyPredicate(value: false, forProperty: MPMediaItemPropertyIsCloudItem)
        query.addFilterPredicate(predicate)
        
        return query.items ?? []
    }
    
    @StateObject private var audioPlayer = AudioPlayer()
    @State private var searchText = ""
    
    private var songs: [MPMediaItem] {
        let allSongs = fetchSongs()
        
        if searchText.isEmpty {
            return allSongs
        } else {
            return allSongs.filter { song in
                (song.title ?? "").localizedCaseInsensitiveContains(searchText)
            }
        }
    }
    
    
    var body: some View {
        ZStack {
            Color.ToofBackgroundColor
                .ignoresSafeArea()
            VStack {
                MainTitleAndBack(title: TextHelper.main.mainSearchTitle.rawValue)
                
                VStack {
                    TextField("Ara...", text: $searchText)
                        .padding(.horizontal, 20)
                        .padding(.vertical, 10)
                        .background(Color(.systemGray6))
                        .cornerRadius(10)
                        .padding(.horizontal)
                    
                    ForEach(songs, id: \.persistentID) { song in
                        HStack {
                            Text(song.title ?? "Bilinmeyen Şarkı")
                            Spacer()
                            Button(action: {
                                audioPlayer.play(song: song)
                            }) {
                                Image(systemName: "play.fill")
                            }
                            .buttonStyle(PlainButtonStyle())
                        }
                    }
                }
            }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}


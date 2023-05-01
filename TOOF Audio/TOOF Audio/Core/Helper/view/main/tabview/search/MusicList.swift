//
//  MusicList.swift
//  TOOF Audio
//
//  Created by NomoteteS on 23.04.2023.
//

import SwiftUI

struct MusicList: View {
    
    @ObservedObject var viewModel: MainSearchViewModel
    
    var body: some View {
        List {
            ForEach(viewModel.filteredMusicFiles.keys.sorted(), id: \.self) { key in
                Section(header: Text(key)) {
                    ForEach(viewModel.filteredMusicFiles[key]!, id: \.self) { musicFile in
                        Button(action: {
                            // TODO: Play music with press
                        }) {
                            HStack {
                                Image(ImageHelper.main.listImages.rawValue)
                                Text(musicFile.lastPathComponent)
                            }
                        }
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.ToofBackgroundColor)
                        .cornerRadius(10)
                    }
                }
                .listRowBackground(Color.ToofBackgroundColor)
            }
            .onDelete(perform:viewModel.deleteMusicFiles)
        }
        .listStyle(.plain)
        .background(Color.ToofBackgroundColor)
        .ignoresSafeArea()
        .padding(.vertical)
    }
}

struct MusicList_Previews: PreviewProvider {
    static var previews: some View {
        MusicList(viewModel: .init(musicFiles: [], currentPlayURL: URL(string: "")!))
    }
}



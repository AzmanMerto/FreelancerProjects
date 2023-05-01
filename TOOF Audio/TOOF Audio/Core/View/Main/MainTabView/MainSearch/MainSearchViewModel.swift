//
//  MainSearchViewModel.swift
//  TOOF Audio
//
//  Created by NomoteteS on 20.04.2023.
//

import Foundation
import AVFAudio
import MediaPlayer

class MainSearchViewModel: ObservableObject {
    
    let appleMusic = AppleMusic()
    
    @Published var audioPlayer: AVAudioPlayer?
    @Published var musicFiles: [URL]
    @Published var currentPlayURL: URL?
    @Published var isShowDocumentPicker: Bool
    @Published var isUserHaveAppleMusicSubs: Bool
    @Published var searchText: String
    
    init(musicFiles: [URL],
         currentPlayURL: URL?,
         isShowDocumentPicker: Bool = false,
         isUserHaveAppleMusicSubs: Bool = false,
         searchText: String = "") {
        self.musicFiles = musicFiles
        self.isShowDocumentPicker = isShowDocumentPicker
        self.isUserHaveAppleMusicSubs = isUserHaveAppleMusicSubs
        self.searchText = searchText
        self.asyncData()
        for musicFile in self.musicFiles {
            print(musicFile.lastPathComponent)
        }
    }
    
    func asyncData(){
        self.musicFiles = self.fetchMusicFilesFromDocuments()
        fetchMusicFilesFromLibrary()
    }
    
    //MARK: MainSearchViewModel - Fetch Music with Button
    func fetchMusicFilesFromDocuments() -> [URL] {
        let fileManager = FileManager.default
        guard let documentsDirectory = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else {
            return []
        }
        
        do {
            let contents = try fileManager.contentsOfDirectory(at: documentsDirectory, includingPropertiesForKeys: nil, options: .skipsHiddenFiles)
            let musicFiles = contents.filter {
                $0.pathExtension.lowercased() == "mp3" ||
                $0.pathExtension.lowercased() == "wav" ||
                $0.pathExtension.lowercased() == "m4a" ||
                $0.pathExtension.lowercased() == "flac" ||
                $0.pathExtension.lowercased() == ""
            }
            return musicFiles
        } catch {
            print("Error fetching music files from documents directory: \(error.localizedDescription)")
            return []
        }
    }
    
    func fetchMusicFilesFromLibrary() {
            let songsQuery = MPMediaQuery.songs()
        print("songs\(String(describing: songsQuery.items?.count))")
            let items = songsQuery.items ?? []
            
            let urls = items.compactMap({ $0.assetURL })
                             .compactMap({ try? URL(resolvingAliasFileAt: $0) })
            
            musicFiles.append(contentsOf: urls)
        }

    
    var filteredMusicFiles: [String: [URL]] {
        var files: [URL]
        
        if searchText.isEmpty {
            files = musicFiles
        } else {
            files = musicFiles.filter { $0.lastPathComponent.localizedStandardContains(searchText) }
        }
        
        let sortedFiles = files.sorted { $0.lastPathComponent.localizedStandardCompare($1.lastPathComponent) == .orderedAscending }
        
        var groupedFiles: [String: [URL]] = [:]
        
        for file in sortedFiles {
            let firstLetter = String(file.lastPathComponent.prefix(1)).uppercased()
            if var sectionFiles = groupedFiles[firstLetter] {
                sectionFiles.append(file)
                groupedFiles[firstLetter] = sectionFiles
            } else {
                groupedFiles[firstLetter] = [file]
            }
        }
        
        return groupedFiles
    }
    
    func deleteMusicFile(at url: URL) {
        let fileManager = FileManager.default
        
        do {
            try fileManager.removeItem(at: url)
            if let index = musicFiles.firstIndex(of: url) {
                musicFiles.remove(at: index)
            }
            
            if let currentURL = currentPlayURL, currentURL == url {
                audioPlayer?.stop()
                audioPlayer = nil
                currentPlayURL = nil
            }
        } catch {
            print("Dosya silinirken hata: \(error.localizedDescription)")
        }
    }
    
    func deleteMusicFiles(at offsets: IndexSet) {
        for index in offsets {
            let url = musicFiles[index]
            deleteMusicFile(at: url)
        }
        musicFiles.remove(atOffsets: offsets)
    }
}

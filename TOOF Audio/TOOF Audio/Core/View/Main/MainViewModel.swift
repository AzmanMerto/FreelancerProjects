//
//  MainViewModel.swift
//  TOOF Audio
//
//  Created by NomoteteS on 29.03.2023.
//

import SwiftUI
import AVFAudio

class MainViewModel: ObservableObject {
    
    var music = MusicPlayer.shared
    
    //MARK: - Player
    @Published var isRandomActive: Bool
    @Published var isOpenedPlayerView: Bool
    @Published var currentTime: TimeInterval
    //MARK: - BrowseView
    @Published var isPressedToConnectSection: Bool
    @Published var connectInt: Int
    //MARK: - Device
    @Published var isNavigateToDetails: Bool
    @Published var isUserSetUpAlarm: Bool
    @Published var atNowPlayingItem: String
    @Published var deviceVolume: Float
    @Published var trableValue: Float
    @Published var bassValue: Float
    //MARK: - Search
    @Published var searchText: String
    @Published var musicFiles: [URL] = []
    @Published var isShowDocumentPicker: Bool = false
    //MARK: - Settings
    @Published var isLogout: Bool
    
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
    
    
    init(//Player
        isRandomActive: Bool = false,
        isOpenedPlayerView: Bool = false,
        currentTime: TimeInterval = 0,
        //BrowseView
        isPressedToConnectSection: Bool = false,
        connectInt: Int = 0,
        //Device
        isNavigateToDetails: Bool = false,
        isUserSetUpAlarm: Bool = false,
        atNowPlayingItem : String = "",
        deviceVolume: Float = 50,
        trableValue: Float = 0,
        bassValue: Float = 0,
        //Search
        searchText:String = "",
        //Settings
        isLogout: Bool = false) {
            //MARK: Player
            self.isRandomActive = isRandomActive
            self.isOpenedPlayerView = isOpenedPlayerView
            self.currentTime = currentTime
            //MARK: BrowseView
            self.isPressedToConnectSection = isPressedToConnectSection
            self.connectInt = connectInt
            //MARK: Device
            self.isNavigateToDetails = isNavigateToDetails
            self.isUserSetUpAlarm = isUserSetUpAlarm
            self.atNowPlayingItem = atNowPlayingItem
            self.deviceVolume = deviceVolume
            self.trableValue = trableValue
            self.bassValue = bassValue
            //MARK: Search
            self.searchText = searchText
            //MARK: Settings
            self.isLogout = isLogout
        }
    //MARK: - BrowseView
    //BrowseView Settings
    let connectModelItems: [ConnectModel] = [
        ConnectModel(connectName: "Wi-fi",connectInt: 0),
        ConnectModel(connectName: "Bluetooth",connectInt: 1),
        ConnectModel(connectName: "Line In",connectInt: 2),
        ConnectModel(connectName: "USBDAC",connectInt: 3)
    ]
    
    //BrowseView Music List
    let musicServicesModelItems: [MusicServicesModel] = [
        MusicServicesModel(imageString:ImageHelper.main.serviceAmazon.rawValue),
        MusicServicesModel(imageString:ImageHelper.main.serviceDeezer.rawValue),
        MusicServicesModel(imageString:ImageHelper.main.serviceSpotify.rawValue),
        MusicServicesModel(imageString:ImageHelper.main.serviceTidal.rawValue)
    ]
    //MARK: - DeviceView
    //DeviceView Settings List
    let DetailServiceButtonItems: [DetailServiceButton] = [
        DetailServiceButton(id: "Renamed", image: ImageHelper.main.renameIcon.rawValue , text: TextHelper.main.mainDeviceSettingsRenameDevice.rawValue),
        DetailServiceButton(id: "Info", image: ImageHelper.main.infoIcon.rawValue , text: TextHelper.main.mainDeviceSettingsInfoDevice.rawValue),
        DetailServiceButton(id: "Alarm", image: ImageHelper.main.alarmIcon.rawValue , text: TextHelper.main.mainDeviceSettingsAlarm.rawValue),
        DetailServiceButton(id: "EQ", image: ImageHelper.main.equalizerIcon.rawValue , text: TextHelper.main.mainDeviceSettingsEQ.rawValue),
        DetailServiceButton(id: "Custom", image: ImageHelper.main.contentIcon.rawValue , text: TextHelper.main.mainDeviceSettingsCustomContent.rawValue)
    ]
    
    //DeviceView Devices
    let deviceModelItems: [DeviceModel] = [
        DeviceModel(deviceGivenName: "Device")
    ]
    //MARK: - SearchView
    //SearchView Fetch Music
    func fetchMusicFilesFromDocuments() -> [URL] {
        let fileManager = FileManager.default
        guard let documentsDirectory = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else { return [] }
        
        var musicFiles: [URL] = []
        do {
            let contents = try fileManager.contentsOfDirectory(at: documentsDirectory, includingPropertiesForKeys: nil)
            musicFiles = contents.filter { $0.pathExtension.lowercased() == "mp3" || $0.pathExtension.lowercased() == "wav" || $0.pathExtension.lowercased() == "m4a" }
        } catch {
            print("Belge dizinindeki dosyalar alınırken hata: \(error.localizedDescription)")
        }
        return musicFiles
    }
    
    //SearchView Delete
    func deleteMusicFile(at url: URL) {
        let fileManager = FileManager.default
        
        do {
            try fileManager.removeItem(at: url)
            if let index = musicFiles.firstIndex(of: url) {
                musicFiles.remove(at: index)
            }
            
            if let currentURL = MusicPlayer.shared.currentlyPlayingURL, currentURL == url {
                music.audioPlayer?.stop()
                music.audioPlayer = nil
                music.currentlyPlayingURL = nil
            }
        } catch {
            print("Dosya silinirken hata: \(error.localizedDescription)")
        }
    }
    
    //SearchView Delete Line
    func deleteMusicFiles(at offsets: IndexSet) {
        for index in offsets {
            let url = musicFiles[index]
            deleteMusicFile(at: url)
        }
        musicFiles.remove(atOffsets: offsets)
    }
    //MARK: - PlayerView

}

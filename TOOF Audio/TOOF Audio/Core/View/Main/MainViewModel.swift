//
//  MainViewModel.swift
//  TOOF Audio
//
//  Created by NomoteteS on 29.03.2023.
//

import SwiftUI

class MainViewModel: ObservableObject {
    
    //Player
    @Published var isRandomActive: Bool
    @Published var isOpenedPlayerView: Bool
    //Browse
    @Published var isPressedToConnectSection: Bool
    @Published var connectInt: Int
    //Device
    @Published var isNavigateToDetails: Bool
    @Published var isPlaying: Bool
    @Published var isUserSetUpAlarm: Bool
    @Published var atNowPlayingItem: String
    @Published var deviceVolume: Float
    @Published var trableValue: Float
    @Published var bassValue: Float
    //Search
    @Published var searchBar: String
    @Published var musicFiles: [URL] = []
    @Published var showDocumentPicker: Bool = false
    //Setting
    @Published var isLogout: Bool
    
    init(isRandomActive: Bool = false,
         isOpenedPlayerView: Bool = false,
        
         isPressedToConnectSection: Bool = false,
         connectInt: Int = 0,
         
         isNavigateToDetails: Bool = false,
         isPlaying : Bool = false,
         isUserSetUpAlarm: Bool = false,
         atNowPlayingItem : String = "",
         deviceVolume: Float = 50,
         trableValue: Float = 0,
         bassValue: Float = 0,
         
         searchBar:String = "",
         
         isLogout: Bool = false) {
        //Player
        self.isRandomActive = isRandomActive
        self.isOpenedPlayerView = isOpenedPlayerView
        //Browse
        self.isPressedToConnectSection = isPressedToConnectSection
        self.connectInt = connectInt
        //Device
        self.isNavigateToDetails = isNavigateToDetails
        self.isPlaying = isPlaying
        self.isUserSetUpAlarm = isUserSetUpAlarm
        self.atNowPlayingItem = atNowPlayingItem
        self.deviceVolume = deviceVolume
        self.trableValue = trableValue
        self.bassValue = bassValue
        //Search
        self.searchBar = searchBar
        //Settings
        self.isLogout = isLogout
    }
    
    let deviceModelItems: [DeviceModel] = [
        DeviceModel(deviceGivenName: "Device")
    ]
    
    let connectModelItems: [ConnectModel] = [
        ConnectModel(connectName: "Wi-fi",connectInt: 0),
        ConnectModel(connectName: "Bluetooth",connectInt: 1),
        ConnectModel(connectName: "Line In",connectInt: 2),
        ConnectModel(connectName: "USBDAC",connectInt: 3)
    ]
    
    let musicServicesModelItems: [MusicServicesModel] = [
        MusicServicesModel(imageString:ImageHelper.main.serviceAmazon.rawValue),
        MusicServicesModel(imageString:ImageHelper.main.serviceDeezer.rawValue),
        MusicServicesModel(imageString:ImageHelper.main.serviceSpotify.rawValue),
        MusicServicesModel(imageString:ImageHelper.main.serviceTidal.rawValue)
    ]
    
    let DetailServiceButtonItems: [DetailServiceButton] = [
        DetailServiceButton(id: "Renamed", image: ImageHelper.main.renameIcon.rawValue , text: TextHelper.main.mainDeviceSettingsRenameDevice.rawValue),
        DetailServiceButton(id: "Info", image: ImageHelper.main.infoIcon.rawValue , text: TextHelper.main.mainDeviceSettingsInfoDevice.rawValue),
        DetailServiceButton(id: "Alarm", image: ImageHelper.main.alarmIcon.rawValue , text: TextHelper.main.mainDeviceSettingsAlarm.rawValue),
        DetailServiceButton(id: "EQ", image: ImageHelper.main.equalizerIcon.rawValue , text: TextHelper.main.mainDeviceSettingsEQ.rawValue),
        DetailServiceButton(id: "Custom", image: ImageHelper.main.contentIcon.rawValue , text: TextHelper.main.mainDeviceSettingsCustomContent.rawValue)
    ]
    //MARK: MainViewModel - Fetch Music
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
    
    //MARK: MainViewModel - Delete
    func deleteMusicFile(at url: URL) {
        let fileManager = FileManager.default
        
        do {
            try fileManager.removeItem(at: url)
            if let index = musicFiles.firstIndex(of: url) {
                musicFiles.remove(at: index)
            }
            
            // Müzik çalıyorsa ve silinen dosya şu anda çalan dosya ise, müziği durdur
            if let currentURL = MusicPlayer.shared.currentlyPlayingURL, currentURL == url {
                MusicPlayer.shared.stop()
            }
        } catch {
            print("Dosya silinirken hata: \(error.localizedDescription)")
        }
    }

    //MARK: MainViewModel - Delete Line
    func deleteMusicFiles(at offsets: IndexSet) {
        for index in offsets {
            let url = musicFiles[index]
            deleteMusicFile(at: url)
        }
        musicFiles.remove(atOffsets: offsets)
    }
    
    
}

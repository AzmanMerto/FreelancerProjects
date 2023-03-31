//
//  MainViewModel.swift
//  TOOF Audio
//
//  Created by NomoteteS on 29.03.2023.
//

import SwiftUI

class MainViewModel: ObservableObject {
    
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
    
    
    init(isPressedToConnectSection: Bool = false,
         connectInt: Int = 0,
         
         isNavigateToDetails: Bool = false,
         isPlaying : Bool = false,
         isUserSetUpAlarm: Bool = false,
         atNowPlayingItem : String = "",
         deviceVolume: Float = 50,
         trableValue: Float = 0,
         bassValue: Float = 0) {
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
    }
    
    let deviceModelItems: [DeviceModel] = [
        DeviceModel(deviceGivenName: "Mutfak")
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
}

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
    @Published var isPlaying: Bool
    @Published var atNowPlayingItem : String
    @Published var deviceVolume: Float
    
    init(isPressedToConnectSection: Bool = false,
         connectInt: Int = 0,
         
         isPlaying : Bool = false,
         atNowPlayingItem : String = "",
         deviceVolume: Float = 50) {
        //Browse
        self.isPressedToConnectSection = isPressedToConnectSection
        self.connectInt = connectInt
        //Device
        self.isPlaying = isPlaying
        self.atNowPlayingItem = atNowPlayingItem
        self.deviceVolume = deviceVolume
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
}

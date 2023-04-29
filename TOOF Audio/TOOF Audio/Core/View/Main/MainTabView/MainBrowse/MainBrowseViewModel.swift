//
//  MainBrowseViewModel.swift
//  TOOF Audio
//
//  Created by NomoteteS on 20.04.2023.
//

import Foundation

class MainBrowseViewModel: ObservableObject {
    
    //    @Published var selectedConnect: Connect?
    
    let connectItems: [ConnectSection] = [ ConnectSection(connectString: "Wi-Fi",tag: 0),
                                           ConnectSection(connectString: "Bluetooth",tag: 1),
                                           ConnectSection(connectString: "Line In", tag: 2),
                                           ConnectSection(connectString: "USBDAC", tag: 3),
                                           ConnectSection(connectString: "OTP", tag: 4)]
    
    let musicServicesModelItems: [MusicServicesModel] = [ MusicServicesModel(imageString:ImageHelper.main.serviceAmazon.rawValue),
                                                          MusicServicesModel(imageString:ImageHelper.main.serviceDeezer.rawValue),
                                                          MusicServicesModel(imageString:ImageHelper.main.serviceSpotify.rawValue),
                                                          MusicServicesModel(imageString:ImageHelper.main.serviceTidal.rawValue)  ]
}

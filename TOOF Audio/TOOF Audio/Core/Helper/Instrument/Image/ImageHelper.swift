//
//  ImageHelper.swift
//  TOOF Audio
//
//  Created by NomoteteS on 14.02.2023.
//

import Foundation

struct ImageHelper {
    
    //MARK: ImageHelper - App Images
    enum app: String {
        case appLogo = "appLogo"
        case toofLogo = "toofLogo"
    }
    //MARK: ImageHelper - Start Views Images
    enum start: String {
        case onboardingImage = "onboardingImage"
    }
    //MARK: ImageHelper - Auth Views Images
    enum auth: String {
        case authBackground = "authBackground"
        case customBack = "customBack"
    }
    
    enum deviceFinder: String {
        case magnifyingGlass = "magnifyingGlass"
        case searchWithWheel = "searchinWithWheel"
        case threePoint = "threePoint"
    }
    
    enum main: String {
        case wheel = "wheel"
        case speaker = "speaker"
        case deviceImage = "deviceImage"
        case serviceAmazon = "serviceAmazon"
        case serviceDeezer = "serviceDeezer"
        case serviceSpotify = "serviceSpotify"
        case serviceTidal = "serviceTidal"
        case myMusic = "myMusic"
        case supportImage = "supportImage"
        case listImages = "listImages"
        
        case alarmIcon = "alarmIcon"
        case alarmObject = "alarmObject"
        case contentIcon = "contentIcon"
        case equalizerIcon = "equalizerIcon"
        case infoIcon = "infoIcon"
        case renameIcon = "renameIcon"
        case rightArrow = "rightArrow"
        case logoutIcon = "logoutIcon"
        case personIcon = "personIcon"
        case supportIcon = "supportIcon"
        case sliderValue = "sliderValue"
        
        case deviceIcon = "deviceIcon"
        case deviceIconFilled = "deviceIconFilled"
        case musicIcon = "musicIcon"
        case musicIconFilled = "musicIconFilled"
        case searchIcon = "searchIcon"
        case searchIconRed = "searchIconRed"
        case searchIconFilled = "searchIconFilled"
        case settingsIcon = "settingsIcon"
        case settingsIconFilled = "settingsIconFilled"
    }
    
    enum player: String {
        case playButton = "playButton"
        case pauseButton = "pauseButton"
        case forwardButton = "forwardButton"
        case backButton = "backButton"
        case randomIcon = "randomIcon"
        case randomIconFilled = "randomIconFilled"
        case Rotate1 = "Rotate1"
        case Rotate2 = "Rotate2"
        case Rotate3 = "Rotate3"
        case playerSpearkerHigh = "playerSpearkerHigh"
        case playerSpearkerLow = "playerSpearkerLow"
    }
}

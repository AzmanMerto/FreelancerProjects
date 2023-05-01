//
//  AppleMusic.swift
//  TOOF Audio
//
//  Created by NomoteteS on 30.04.2023.
//

import SwiftUI
import MusicKit
import StoreKit
import MediaPlayer


class AppleMusic: ObservableObject {
    
    let controller = SKCloudServiceController()
    let mediaLibrary = MPMediaLibrary()
    let songsQuery = MPMediaQuery.songs()
    
    @Published var isAppleRequestSuccess : Bool
    
    init(isAppleRequestSuccess: Bool = false) {
        self.isAppleRequestSuccess = isAppleRequestSuccess
    }
    
    func checkUserAppleMusicRequest() {
        SKCloudServiceController.requestAuthorization { (status: SKCloudServiceAuthorizationStatus) in
            switch status {
            case .authorized:
                self.isAppleRequestSuccess = true
                print("Success AppleMusic checkUserAppleMusicRequest status")
            default:
                print("FIXto AppleMusic checkUserAppleMusicReques status: ERROR")
                break
            }
        }
    }
    
    func checkAppleMusicSubscription(completion: @escaping (Bool) -> Void) {
        let predicate = MPMediaPropertyPredicate(value: MPMediaType.music.rawValue, forProperty: MPMediaItemPropertyMediaType)
        songsQuery.addFilterPredicate(predicate)
        let result = songsQuery.collections?.isEmpty == false
        completion(result)
    }
    
    func songList() {
        
        
        print("\(String(describing: songsQuery.items))")
    }
    
}


//
//  LocationPermissionManager.swift
//  TOOF Audio
//
//  Created by NomoteteS on 28.04.2023.
//

import Foundation
import CoreLocation

class LocationPermissionManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    @Published var locationPermissionGranted: Bool = false
    private let locationManager = CLLocationManager()
    
    override init() {
        super.init()
        self.locationManager.delegate = self
    }
    
    func requestLocationPermission() {
        locationManager.requestWhenInUseAuthorization()
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        switch manager.authorizationStatus {
        case .authorizedWhenInUse, .authorizedAlways:
            locationPermissionGranted = true
        default:
            locationPermissionGranted = false
        }
    }
}

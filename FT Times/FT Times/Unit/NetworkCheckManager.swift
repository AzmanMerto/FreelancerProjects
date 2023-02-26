//
//  NetworkCheckManager.swift
//  FT Times
//
//  Created by NomoteteS on 26.02.2023.
//

import Foundation
import Network

class NetworkManager: ObservableObject {
    
    static var networkManager = NetworkManager()
    
    let monitor = NWPathMonitor()
    let queue = DispatchQueue(label: "Monitor")
    @Published private(set) var connected: Bool = false
    
    func checkConnection() {
        monitor.pathUpdateHandler = { path in
            if path.status == .satisfied {
                    self.connected = true
            } else {
                    self.connected = false
            }
        }
        monitor.start(queue: queue)
    }
}

//
//  LocalNetworkAccessManager.swift
//  TOOF Audio
//
//  Created by NomoteteS on 28.04.2023.
//

import Foundation
import Network

class LocalNetworkPermissionManager: ObservableObject {
    @Published var localNetworkPermissionGranted: Bool = false

    func checkLocalNetworkPermission() {
        let monitor = NWPathMonitor()
        monitor.pathUpdateHandler = { path in
            if path.status == .satisfied {
                DispatchQueue.main.async {
                    self.localNetworkPermissionGranted = true
                }
            } else {
                DispatchQueue.main.async {
                    self.localNetworkPermissionGranted = false
                }
            }
        }

        let queue = DispatchQueue(label: "LocalNetworkMonitor")
        monitor.start(queue: queue)
    }
}

//
//  ContentView.swift
//  TOOF Audio
//
//  Created by NomoteteS on 27.04.2023.
//

//import SwiftUI
//
//struct ContentView: View {
//    @State private var responseText = "Sonuç bekleniyor..."
//
//    var body: some View {
//        VStack {
//            Button(action: {
//                sendAPIRequest(command: "wlanGetApListEx") { result in
//                    switch result {
//                    case .success(let response):
//                        DispatchQueue.main.async {
//                            responseText = "Bulunan SSID'lerin sayısı: \(response.res)\n\n"
//                            for ap in response.aplist {
//                                responseText += "SSID: \(ap.ssid), BSSID: \(ap.bssid), Kanal: \(ap.channel), RSSI: \(ap.rssi), Yetkilendirme: \(ap.auth), extch: \(ap.extch)\n"
//                            }
//                        }
//                    case .failure(let error):
//                        DispatchQueue.main.async {
//                            responseText = "Hata: \(error.localizedDescription)"
//                        }
//                    }
//                }
//            }) {
//                Text("API İsteği Gönder")
//            }
//
//            Button(action: {
//                connectToWiFi(ssid: "YOUR_SSID", channel: 6, auth: "WPA2PSK", encry: "AES", password: "YOUR_PASSWORD") { result in
//                    switch result {
//                    case .success(let response):
//                        DispatchQueue.main.async {
//                            responseText = "Bağlantı Sonucu: \(response)"
//                        }
//                    case .failure(let error):
//                        DispatchQueue.main.async {
//                            responseText = "Hata: \(error.localizedDescription)"
//                        }
//                    }
//                }
//            }) {
//                Text("WiFi'ye Bağlan")
//            }
//
//            ScrollView {
//                Text(responseText)
//                    .padding()
//            }
//        }
//    }
//}
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}

import SwiftUI
import Network

import SwiftUI
import Network

//struct ContentView: View {
//    @StateObject private var localNetworkManager = LocalNetworkPermissionManager()
//
//    var body: some View {
//        VStack {
//            if localNetworkManager.localNetworkPermissionGranted {
//                Text("Yerel ağ izni verildi.")
//            } else {
//                Text("Yerel ağ izni verilmedi.")
//            }
//
//            if let errorMessage = localNetworkManager.errorMessage {
//                Text("Hata: \(errorMessage)")
//                    .foregroundColor(.red)
//            }
//
//            Button(action: {
//                localNetworkManager.startDiscoveringServices()
//            }) {
//                Text("Hizmetleri Keşfet")
//            }
//        }
//    }
//}


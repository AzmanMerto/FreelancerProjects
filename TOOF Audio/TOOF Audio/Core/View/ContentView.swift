//
//  ContentView.swift
//  TOOF Audio
//
//  Created by NomoteteS on 27.04.2023.
//
import Combine
import SwiftUI

class APListViewModel: ObservableObject {
    @Published var aplist = [APResponse]()
    @Published var response: Response?
    @Published var isLoading = false
    private var cancellables = Set<AnyCancellable>()

    func fetchAPList() {
        guard let url = URL(string: "http://192.168.10.1/httpapi.asp?command=wlanGetApListEx") else { return }

        self.isLoading = true

        URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: Response.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure(let error):
                    print("Error fetching data: \(error)")
                    self.isLoading = false
                case .finished:
                    self.isLoading = false
                }
            }, receiveValue: { response in
                self.response = response
                self.aplist = response.aplist
            })
            .store(in: &cancellables)
    }
}


struct ContentView: View {
    @ObservedObject var viewModel = APListViewModel()
    
    var body: some View {
        VStack {
            if viewModel.isLoading {
                ProgressView()
            } else {
                List(viewModel.aplist, id: \.bssid) { ap in
                    VStack(alignment: .leading) {
                        Text("SSID: \(ap.ssid)")
                        Text("BSSID: \(ap.bssid)")
                        Text("Channel: \(ap.channel)")
                        Text("RSSI: \(ap.rssi)")
                        Text("Auth: \(ap.auth)")
                        Text("ExtCh: \(ap.extch)")
                    }
                }
            }
        }
        .onAppear {
            viewModel.fetchAPList()
        }
    }
}


import Foundation

struct APResponse: Decodable {
    let auth: String
    let bssid: String
    let channel: Int
    let extch: String
    let rssi: Int
    let ssid: String
}

struct Response: Decodable {
    let res: Int
    let aplist: [APResponse]
}


//import SwiftUI
//
//struct Response: Decodable {
//    let res: [String: String]
//}
//
//struct ContentView: View {
//
//    var body: some View {
//
//        VStack {
//            Button {
//                AF.request("http://192.168.10.1/httpapi.asp?command=wlanGetApListEx", method: .get)
//                  .validate()
//                  .responseDecodable(of: Response.self) { response in
//                      switch response.result {
//                      case .success(let data):
//                          print("Data: \(data)")
//                      case .failure(let error):
//                          print("Error: \(error)")
//                      }
//                  }
//
//            } label: {
//                Text("hghb")
//            }
//            .buttonStyle(.bordered)
//
//        }
//
//    }
//}
//
//
//
//struct APInfo: Decodable {
//    let auth: String
//    let bssid: String
//    let channel: Int
//    let extch: String
//    let rssi: Int
//    let ssid: String
//}
//
//struct APListResponse: Decodable {
//    let res: Int
//    let aplist: [APInfo]
//}
//
//func performAPListRequest() async throws -> APListResponse {
//    guard let url = URL(string: "http://4.6.327252.26/httpapi.asp?command=wlanGetApListEx") else {
//        throw URLError(.badURL)
//    }
//
//    var request = URLRequest(url: url)
//    request.httpMethod = "GET"
//    request.timeoutInterval = 30
//
//    let (data, response) = try await URLSession.shared.data(for: request)
//    guard let httpResponse = response as? HTTPURLResponse, (200..<300).contains(httpResponse.statusCode) else {
//        throw URLError(.badServerResponse)
//    }
//
//    let decoder = JSONDecoder()
//    let result = try decoder.decode(APListResponse.self, from: data)
//    return result
//}
//
//struct ContentView: View {
//    @StateObject var viewModel = ViewModel()
//
//    var body: some View {
//        VStack {
//            List(viewModel.apList, id: \.bssid) { ap in
//                VStack(alignment: .leading) {
//                    Text("SSID: \(ap.ssid)")
//                    Text("BSSID: \(ap.bssid)")
//                    Text("Channel: \(ap.channel)")
//                    Text("RSSI: \(ap.rssi)")
//
//                }
//                .onAppear {
//                    print("SSID: \(ap.ssid)")
//                }
//            }
//            .padding()
//
//            Button("Fetch AP List") {
//                Task {
//                    try? await viewModel.fetchAPList()
//                }
//            }
//        }
//    }
//}
//
//class ViewModel: ObservableObject {
//    @Published var apList: [APInfo] = []
//
//    func fetchAPList() async throws {
//        do {
//            let response = try await performAPListRequest()
//            self.apList = response.aplist
//        } catch {
//            // Handle error here
//        }
//    }
//}

//import SwiftUI
//
//struct SpeakerControlView: View {
//    @State private var volume: Int? // Example initial volume value
//
//    var body: some View {
//        VStack {
//            Text("Speaker Control")
//                .font(.title)
//                .padding()
//
//            Text(String(volume ?? 0))
//
//            Button(action: {
//                // Perform GET API request to control volume
//                controlVolume(volume ?? 0)
//            }) {
//                Text("Set Volume")
//                    .font(.headline)
//                    .foregroundColor(.white)
//                    .padding()
//                    .background(Color.blue)
//                    .cornerRadius(10)
//            }
//        }
//    }
//
//    func controlVolume(_ res: Int) {
//        // Make GET API request to control volume using the LinkPlay API
//        // You'll need to replace the placeholders with your actual API endpoint and parameters
//
//        let endpoint = ""
//        let parameters = ["res": "\(res)"]
//
//        guard let url = URL(string: endpoint) else {
//            print("Invalid URL")
//            return
//        }
//
//        var request = URLRequest(url: url)
//        request.httpMethod = "GET"
//        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
//        request.httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: [])
//
//        URLSession.shared.dataTask(with: request) { data, response, error in
//            if let error = error {
//                print("Error: \(error)")
//                return
//            }
//
//            guard let data = data else {
//                print("No data received")
//                return
//            }
//
//            // Process the response data if needed
//
//        }.resume()
//    }
//}
//
//struct ContentView: View {
//    var body: some View {
//        SpeakerControlView()
//    }
//}
//
//

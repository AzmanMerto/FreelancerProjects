//
//  ConnectDevice.swift
//  TOOF Audio
//
//  Created by NomoteteS on 27.04.2023.
//

import Foundation

//func sendAPIRequest(command: String, completion: @escaping (Result<ApiResponse, Error>) -> Void) {
//    let urlString = "http://192.168.10.1/httpapi.asp?command=\(command)"
//    
//    guard let url = URL(string: urlString) else {
//        print("Invalid URL")
//        return
//    }
//    
//    var request = URLRequest(url: url)
//    request.timeoutInterval = 30 
//    
//    let task = URLSession.shared.dataTask(with: request) { data, response, error in
//        if let data = data {
//            do {
//                let decoder = JSONDecoder()
//                let responseData = try decoder.decode(ApiResponse.self, from: data)
//                completion(.success(responseData))
//            } catch {
//                completion(.failure(error))
//            }
//        } else if let error = error {
//            completion(.failure(error))
//        }
//    }
//    
//    task.resume()
//}
//
//
//func connectToWiFi(ssid: String, channel: Int, auth: String, encry: String, password: String, completion: @escaping (Result<String, Error>) -> Void) {
//    let hexSSID = ssid.data(using: .utf8)?.map({ String(format: "%02x", $0) }).joined() ?? ""
//    let hexPassword = password.data(using: .utf8)?.map({ String(format: "%02x", $0) }).joined() ?? ""
//    
//    let command = "wlanConnectApEx:ssid=\(hexSSID):ch=\(channel):auth=\(auth):encry=\(encry):pwd=\(hexPassword):chext=1"
//    
//    sendAPIRequest(command: command) { result in
//        switch result {
//        case .success(let response):
//            completion(.success(response.status))
//        case .failure(let error):
//            completion(.failure(error))
//        }
//    }
//}
//

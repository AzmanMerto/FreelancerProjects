//
//  DataModel.swift
//  Metin2AddServerApp
//
//  Created by NomoteteS on 16.03.2023.
//

import Foundation

struct DataModel: Equatable {
    var id = UUID().uuidString
    var title: String
    var date: String
    var url: String
}

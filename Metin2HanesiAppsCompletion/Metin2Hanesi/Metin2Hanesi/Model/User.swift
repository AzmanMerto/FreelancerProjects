//
//  User.swift
//  Metin2Hanesi
//
//  Created by NomoteteS on 14.04.2023.
//

import SwiftUI
import FirebaseFirestoreSwift

struct User: Codable {
    let uid: String
}

struct Message: Codable, Identifiable {
    @DocumentID var id: String?
    let text: String
    let userId: String
    let timestamp: Date
}

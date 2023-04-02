//
//  userData.swift
//  TOOF Audio
//
//  Created by NomoteteS on 2.04.2023.
//

import FirebaseFirestoreSwift

struct UserData: Identifiable,Codable {
    var name: String
    var email: String
    @DocumentID var id: String?
}

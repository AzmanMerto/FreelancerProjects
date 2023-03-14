//
//  UserData.swift
//  Shigo
//
//  Created by NomoteteS on 12.03.2023.
//

import FirebaseFirestore
import FirebaseFirestoreSwift

struct UserData: Identifiable,Codable {
    var uid: String
    var fullname: String
    var profileImageUrl: String
    
    @DocumentID var id: String?
}

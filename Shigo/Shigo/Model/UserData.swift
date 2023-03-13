//
//  UserData.swift
//  Shigo
//
//  Created by NomoteteS on 12.03.2023.
//

import FirebaseFirestore
import FirebaseFirestoreSwift

struct UserData: Identifiable,Codable {
    var fullname: String
    var email: String
    var profileImageUrl: String
    var jobTitle: String?
    var job: String?
    
    @DocumentID var id: String?
}

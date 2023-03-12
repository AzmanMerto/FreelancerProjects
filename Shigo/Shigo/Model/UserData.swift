//
//  UserData.swift
//  Shigo
//
//  Created by NomoteteS on 12.03.2023.
//

import FirebaseFirestoreSwift

struct UserData: Identifiable,Decodable {
    let fullname: String
    let email: String
    let profileImageUrl: String
    
    @DocumentID var id: String?
}

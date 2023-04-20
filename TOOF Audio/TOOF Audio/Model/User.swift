//
//  User.swift
//  TOOF Audio
//
//  Created by NomoteteS on 18.04.2023.
//

import FirebaseFirestoreSwift

struct User: Identifiable, Codable {
    @DocumentID var id: String?
    var mail: String?
    var name: String?
    var password: String?
    
    func toDictionary() -> [String: Any] {
        return ["id": id!,
                "mail": mail!,
                "name": name!]
    }
}

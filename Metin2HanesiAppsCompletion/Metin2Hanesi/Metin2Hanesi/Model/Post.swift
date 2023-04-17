//
//  Post.swift
//  Metin2Hanesi
//
//  Created by NomoteteS on 16.04.2023.
//

import FirebaseFirestoreSwift

struct Post: Codable,Identifiable {
    @DocumentID var id: String?
    var name: String
    var date: String
    var image: String
    var url: String
}

//
//  FirestoreManager.swift
//  Metin2Hanesi
//
//  Created by NomoteteS on 19.03.2023.
//

import Firebase
import FirebaseFirestore
import UIKit

class FirestoreManager: ObservableObject {
    static let shared = FirestoreManager()
    
    @Published var postThisWeek: [Post] = []
    
    func fetchPosts(collection: String) {
        Firestore.firestore().collection(collection).getDocuments { snapshot, error in
            if let error = error { print("FIXto FirestoreManger: \(error.localizedDescription)"); return}
            
            guard let document = snapshot?.documents else { return }
            
            self.postThisWeek = document.compactMap({ document in
                try? document.data(as: Post.self)
            })
        }
    }
    
}

//let COLLECTION_thisWeekServer = Firestore.firestore().collection("thisWeekServer")
//let COLLECTION_VSServer = Firestore.firestore().collection("VSServer")
//let COLLECTION_55_120Server = Firestore.firestore().collection("55-120Server")
//let COLLECTION_1_99Server = Firestore.firestore().collection("1-99Server")
//let COLLECTION_1_120Server = Firestore.firestore().collection("1-120Server")
//let COLLECTION_1_105Server = Firestore.firestore().collection("1-105Server")

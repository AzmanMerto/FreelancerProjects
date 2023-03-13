//
//  ProfileViewModel.swift
//  Shigo
//
//  Created by NomoteteS on 10.03.2023.
//

import SwiftUI
import FirebaseFirestore

class ProfileViewModel: ObservableObject {
    var user = [UserData]()
    
    private var db = Firestore.firestore()
    
    func fetchUser() {
        db.collection("users").addSnapshotListener { snapShot, err in
            guard let documents = snapShot?.documents else { return }
            
            self.user = documents.map({ snapiShot -> UserData in
                
                let data = snapiShot.data()
                
                let fullname = data[""]
                
                return UserData(fullname: <#T##String#>, email: <#T##String#>, profileImageUrl: <#T##String#>)
            })
        }
    }
   
}

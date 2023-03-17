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

}

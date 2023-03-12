//
//  AuthManager.swift
//  Shigo
//
//  Created by NomoteteS on 11.03.2023.
//

import SwiftUI
import Firebase
import FirebaseAuth
import FirebaseFirestore

class AuthManager: ObservableObject {
    
    static let shared = AuthManager()
    
    @Published var userCheck: FirebaseAuth.User?
    @Published var userData: UserData?
    
    @Published var correctAuth: Bool = false
    
    init() {
        self.userCheck = Auth.auth().currentUser
        
    }
    
    func login(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { result , err in
            if err != nil {
                print("FIXto: \(err?.localizedDescription ?? "UNKNOWN ERROR")")
            }else {
                guard let user = result?.user else { return }
                self.userCheck = user
            }
        }
    }
    
    func regitser(email: String, password: String, name: String,image: UIImage ) {
        ImageUploader.uploadImage(image: image) { imageUrl in
            Auth.auth().createUser(withEmail: email, password: password) { result, err in
                if err != nil {
                    print("err")
                    return
                } else {
                    guard let user = result?.user else { return }
                    self.correctAuth.toggle()
                    let data = ["id" : user.uid,
                                "imageUrl" : imageUrl,
                                "email" : email,
                                "name" : name]
                    self.userCheck = user
                    
                    COLLECTION_USERS.document(user.uid).setData(data) { err in
                        if let err = err {
                            print("FIXto: \(err.localizedDescription)")
                        }
                    }
                }
            }
        }        
    }
}

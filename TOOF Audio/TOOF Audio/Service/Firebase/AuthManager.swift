//
//  AuthManager.swift
//  TOOF Audio
//
//  Created by NomoteteS on 1.04.2023.
//

import Firebase
import FirebaseAuth
import FirebaseFirestore

@MainActor class AuthManager: ObservableObject {
    
    static let shared = AuthManager()
    
    @Published var currentUser: FirebaseAuth.User?
    @Published var isResetPassword: Bool = false
    
    init() {
        self.currentUser = Auth.auth().currentUser
    }
    
    func login(email: String, password: String, completion: @escaping () -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { authResult , error in
            if let error = error {
                print("Error login user: \(error.localizedDescription)")
                return
            }
            guard let user = authResult?.user else { return }
            self.currentUser = user
            completion()
        }
    }
    
    func register(name: String, email: String, password:String, completion: @escaping () -> Void) {
        Auth.auth().createUser(withEmail: email, password: password){ authResult , error in
            if let error = error {
                print("Error registering user: \(error.localizedDescription)")
                return
            }
            guard let user = authResult?.user else {
                print("User not found")
                return
            }
            let data = ["id": user.uid,
                        "email": email,
                        "name": name]
            COLLECTION_USER.document(user.uid).setData(data) { error in
                if let error = error {
                    print("Error saving user data: \(error.localizedDescription)")
                    return
                }
                self.currentUser = user
                completion()
            }
        }
    }

    func resetPasswordWithMail(email: String){
        Auth.auth().sendPasswordReset(withEmail: email) { error in
            guard error != nil else {print("FIXto reset: \(String(describing: error?.localizedDescription))"); return }
            self.isResetPassword = true
        }
    }
}

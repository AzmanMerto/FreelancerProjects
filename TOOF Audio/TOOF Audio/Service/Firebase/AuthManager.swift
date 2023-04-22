//
//  AuthManager.swift
//  TOOF Audio
//
//  Created by NomoteteS on 18.04.2023.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class AuthManager: ObservableObject {
    
    static let shared = AuthManager()
    let auth = Auth.auth()
    @Published var currentUser: FirebaseAuth.User?
    @Published var user: User?
    
    init() {
        self.currentUser = Auth.auth().currentUser
        fetchUser()
    }
    
    //MARK: AuthManager - Register
    func register(userMail mail: String,userName name: String,userPassword: String, completion: @escaping () -> Void) {
        auth.createUser(withEmail: mail, password: userPassword) { authResult, error in
            if let error = error {
                print("FIXto AuthManager createUser: \(error.localizedDescription)")
                return
            }
            
            guard let user = authResult?.user else { print("User not found"); return }
            let data = User(id: user.uid, mail: mail, name: name)
            
            COLLECTION_USER.addDocument(data: data.toDictionary()) { error in
                if let error = error {
                    print("FIXto AuthManager addDocument: \(error.localizedDescription)")
                }
                completion()
                self.user = data
            }
        }
    }
    
    //MARK: AuthManager - signIN
    func signIn(userMail mail: String, password: String, comptletion: @escaping () -> ()) {
        auth.signIn(withEmail: mail, password: password) { result, error in
            if let error = error {
                print("FIXto AuthManager signIn: \(error.localizedDescription)")
                return
            }else {
                comptletion()
            }
        }
    }
    
    //MARK: AuthManager - resetPassword
    func resetPassword(userMail mail: String, completion: @escaping () -> Void) {
        auth.sendPasswordReset(withEmail: mail) { error in
            if let error = error {
                print("FIXto AuthManager resetPassword: \(error.localizedDescription)")
                return
            }else {
                completion()
            }
        }
    }
    
    //MARK: AuthManager - signOut
    func signOut(){
        
        do {
            try auth.signOut()
            currentUser = nil
        } catch {
            print("FIXto authManager signOut: \(error.localizedDescription)")
        }
        
    }
    
    //MARK: AuthManager - fetchUser
    func fetchUser() {
        guard let uid = currentUser?.uid else { print("FIXto: AuthManager fetchUser: No User "); return }
        COLLECTION_USER.document(uid).getDocument { result, error in
            if let error = error {
                print("FIXto: AuthManager fetchUser: cant fetch \(error.localizedDescription)")
                return
            }
            
            guard let data = result?.data() else { return }
            
            let id = data["id"] as? String ?? ""
            let mail = data["mail"] as? String ?? ""
            let name = data["name"] as? String ?? ""
            
            self.user = User(id: id, mail: mail, name: name)
        }
    }
}

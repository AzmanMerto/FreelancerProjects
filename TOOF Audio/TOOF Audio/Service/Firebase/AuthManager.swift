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
    @Published var userData: UserData?
    
    init() {
        self.currentUser = Auth.auth().currentUser
        fetchUserData()
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
    
    func fetchUserData(){
        guard let uid = currentUser?.uid else { return }
        COLLECTION_USER.document(uid).getDocument { snapshot, error in
            if let error = error {
                print("Error fetch data \(error.localizedDescription)")
                return
            }
            
            guard let data = snapshot?.data() else { return }
            
            let id = data["id"] as? String ?? ""
            let name = data["name"] as? String ?? ""
            let email = data["email"] as? String ?? ""
            
            self.userData = UserData(name: name, email: email, id: id)
        }
    }
    
    func logout() {
        do {
            try Auth.auth().signOut()
        } catch {
            print("Failed logout")
        }
    }

    func resetPasswordWithMail(email: String, completion: @escaping () -> Void){
        Auth.auth().sendPasswordReset(withEmail: email) { error in
            if let error = error {
                print("Error reset mail user data: \(error.localizedDescription)")
                return
            }
            completion()
        }
    }
}

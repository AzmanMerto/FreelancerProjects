//
//  AuthManager.swift
//  Metin2Hanesi
//
//  Created by NomoteteS on 14.04.2023.
//

import Foundation
import Firebase
import FirebaseAuth

class AuthService: ObservableObject {
    @Published var user: FirebaseAuth.User?

    func signInAnonymously() {
        Auth.auth().signInAnonymously { result, error in
            if let error = error {
                print("Hata: \(error.localizedDescription)")
            } else if let user = result?.user {
                self.user = user
                print("Anonim kullanıcı oturum açtı: \(user.uid)")
            }
        }
    }
}

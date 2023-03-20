//
//  ImageUploader.swift
//  Metin2HanesiAdminPanel
//
//  Created by NomoteteS on 19.03.2023.
//

import SwiftUI
import FirebaseStorage

import FirebaseStorage

struct ImageUploader {
    static func uploadImage(image: UIImage, completetion: @escaping(String) -> Void) {
        guard let imageData = image.jpegData(compressionQuality: 0.5) else { return }
        let fileName = NSUUID().uuidString
        let ref = Storage.storage().reference(withPath: "/serverImage/\(fileName)")

        ref.putData(imageData) { _, error in
            
            if let error = error {
                print("DEBUG: Failed to upload images\(error.localizedDescription)")
                return
            }
            
            ref.downloadURL { url, _ in
                guard let imageUrl = url?.absoluteString else { return }
                completetion(imageUrl)
            }
        }
    }
}

//
//  RegisterViewModel.swift
//  Shigo
//
//  Created by NomoteteS on 5.03.2023.
//

import SwiftUI

class RegisterViewModel: ObservableObject {
    
    @Published var email: String
    @Published var name: String
    @Published var password: String
    @Published var againPassword: String
    @Published var uiImager: UIImage?
    @Published var image: Image?
    @Published var isImagePickerSelected: Bool
    @Published var isSkiptoPage: Bool
    
    init(email: String = "",
         name: String = "",
         password: String = "",
         againPassword: String = "",
         uiImager: UIImage? = nil,
         image: Image? = nil,
         isImagePickerSelected: Bool = false,
         isSkiptoPage: Bool = false) {
        self.email = email
        self.name = name
        self.password = password
        self.againPassword = againPassword
        self.uiImager = uiImager
        self.image = image
        self.isImagePickerSelected = isImagePickerSelected
        self.isSkiptoPage = isSkiptoPage
    }
    
    func loadedImage() {
        guard let imager = self.uiImager else { return }
        self.image = Image(uiImage: imager)
    }
    
}
   

//
//  LoginPlace.swift
//  Shigo
//
//  Created by NomoteteS on 5.03.2023.
//

import SwiftUI

struct LoginPlace: View {
    
    @Binding var email: String
    @Binding var password: String
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(.white)
                .padding(.all)
                .frame(height: 400)
                .background{    Color.black     }
            VStack {
                VStack {
                    CustomTextField(text: "Email",
                                    textField: $email)
                    SecureCustomTextField(text: "Password", textField: $password)
                }
                .padding(.bottom)
                PrimaryButton(text: "Giriş Yap") {

                }
                .padding(.horizontal)
                LoginWithApp(isActive: .constant(false))
                    .padding(.top)
            }
            .padding(.horizontal)
        }
        .padding(.all,30)
    }
}

struct LoginPlace_Previews: PreviewProvider {
    static var previews: some View {
        LoginPlace(email: .constant(""),
                   password: .constant(""))
    }
}

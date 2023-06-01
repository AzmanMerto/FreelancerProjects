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
    @State var isMailWayTrue: Bool = false
    @State var isPassowrdWayTrue: Bool = false
    var action: () -> ()
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(.white)
                .padding(.all)
                .frame(height: 400)
                .background{    Color.black     }
            VStack {
                VStack(alignment: .leading) {
                    CustomTextField(text: "Email",
                                    textField: $email)
                    Text("Lütfen mailini doldur")
                        .font(.caption)
                        .padding(.horizontal)
                        .onChange(of: email, perform: { newValue in
                            if !newValue.isEmpty {
                                isMailWayTrue = true
                            }
                        })
                        .opacity(isMailWayTrue ? 1 : 0)
                    
                    SecureCustomTextField(text: "Password", textField: $password)
                    Text(password.count > 6 ? "Şifreniz 6 karakter fazla olmaı" : "Lütfen şifreni doldur" )
                        .font(.caption)
                        .padding(.horizontal)
                        .onChange(of: password, perform: { newValue in
                            if !newValue.isEmpty {
                                isPassowrdWayTrue = true
                            }
                        })
                        .opacity(isPassowrdWayTrue ? 1 : 0)
                }
                .padding(.bottom)
                PrimaryButton(text: "Giriş Yap") {
                    if email.isEmpty {
                        isMailWayTrue.toggle()
                    } else if password.isEmpty {
                        isPassowrdWayTrue.toggle()
                    } else {
                        action()
                    }
                }
                .padding(.horizontal)
                //MARK: LoginView - With App Login
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
                   password: .constant("")) {
            
        }
    }
}

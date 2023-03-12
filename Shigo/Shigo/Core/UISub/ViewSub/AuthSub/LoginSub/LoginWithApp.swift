//
//  LoginWithApp.swift
//  Shigo
//
//  Created by NomoteteS on 11.03.2023.
//

import SwiftUI
import AuthenticationServices

struct LoginWithApp: View {
    
    @Binding var isActive: Bool
    
    var body: some View {
        HStack(spacing: 40){
            // MARK: LoginWithApp
            LoginWithAppButton(imageString: Imagements.Auth.instagramIcon.rawValue,size: CGSize(width: 40, height: 40)){
                
            }
            
            LoginWithAppButton(imageString: Imagements.Auth.tiktokIcon.rawValue,size: CGSize(width: 40, height: 40)){
                
            }
            
            LoginWithAppButton(imageString: Imagements.Auth.googleIcon.rawValue,size: CGSize(width: 40, height: 40)){
            }
            
            //MARK: LoginWithApp - Login With Apple
            LoginWithAppButton(imageString: Imagements.Auth.appleIcon.rawValue, size: CGSize(width: 40, height: 45)) {
 
            }
        }
        .padding(.horizontal)
    }
}

struct LoginWithApp_Previews: PreviewProvider {
    static var previews: some View {
        LoginWithApp(isActive: .constant(false))
    }
}


private struct LoginWithAppButton: View {
    var imageString: String
    var size: CGSize
    var action: () -> ()
    var body: some View {
        Button {
            action()
        } label: {
            Image(imageString)
                .resizable()
                .frame(width: size.width, height: size.height)
        }
    }
}

private struct AppleLogoSign: View {
    
    @AppStorage("email") var email : String = ""
    @AppStorage("fullname") var fullname : String = ""
    @AppStorage("userID") var userID: String = ""
    
    var body: some View {
        SignInWithAppleButton  { request in
            request.requestedScopes = [.email,.fullName]
        } onCompletion: { result in
            switch result {
            case .success(let Auth):
                
                switch Auth.credential {
                case let credential as ASAuthorizationAppleIDCredential:
                    let userID = credential.user
                    let email = credential.email
                    let fisrtName = credential.fullName?.givenName
                    let lastName = credential.fullName?.familyName
                    
                    self.email = email ?? ""
                    self.fullname = String("\(fisrtName) \(lastName)")
                    self.userID = userID
                default:
                    break
                }
            case .failure(let error):
                print(error)
            }
        }
        .frame(width: 43)
        .signInWithAppleButtonStyle(.white)
    }
}

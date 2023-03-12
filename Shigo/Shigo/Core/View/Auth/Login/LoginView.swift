//
//  LoginView.swift
//  Shigo
//
//  Created by NomoteteS on 4.03.2023.
//

import SwiftUI

struct LoginView: View {
    
    @StateObject var viewModel : LoginViewModel = .init()
    @EnvironmentObject var coordinator : AuthCoordinator
    
    var body: some View {
        ZStack {
            //MARK: LoginView - Background Color
            PrimaryBackground()
            VStack {
                //MARK: LoginView - Flag & Desciption
                FlagAndCountryName()
                    .padding(.top)
                Spacer()
                LoginPlace(email: $viewModel.email,
                           password: $viewModel.password)
                Spacer()
                //MARK: LoginView - With Normal Login
                let status = ((viewModel.email.count > 0) && (viewModel.password.count > 0))
                AuthChangeButton(text: "ÜYE OL") {
                        coordinator.push(.registerView)
                    if status {
                        viewModel.isLoggedIn.toggle()
                    }
                }
                Spacer()
                //MARK: LoginView - With App Login
                LoginWithApp(isActive: $viewModel.isLoggedIn)
            }
        }
        .onAppear{
            if viewModel.isLoggedIn {
                AuthManager.shared.login(email: viewModel.email,
                                         password: viewModel.password)
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

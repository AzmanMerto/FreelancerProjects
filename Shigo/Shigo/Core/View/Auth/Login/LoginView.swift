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
        NavigationView {
            ZStack {
                //MARK: LoginView - Background Color
                PrimaryBackground()
                VStack {
                    //MARK: LoginView - Flag & Desciption
                    FlagAndCountryName()
                        .padding(.top)
                    Spacer()
                    LoginPlace(email: $viewModel.email,
                               password: $viewModel.password) {
                        AuthManager.shared.login(email: viewModel.email,
                                                 password: viewModel.password)
                    }
                    Spacer()
                    //MARK: LoginView - With Normal Login
                    AuthChangeButton(text: "ÜYE OL") {
                        coordinator.push(.registerView)
                    }
                    Spacer()
                }
            }
            .onAppear{
                if AuthManager.shared.correctAuth {
                        viewModel.isLoggedIn = true
                }
            }
        }
        .navigationDestination(isPresented: $viewModel.isLoggedIn) {
            MainTabBar()
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

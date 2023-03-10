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
                AuthChangeButton(text: "ÜYE OL") {
                        coordinator.push(.registerView)
                }
                Spacer()
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
            .previewDevice("iPhone 14")
    }
}



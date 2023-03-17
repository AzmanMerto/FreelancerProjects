//
//  HomeView.swift
//  Shigo
//
//  Created by NomoteteS on 10.03.2023.
//

import SwiftUI
import FirebaseAuth

struct HomeView: View {
        
    @ObservedObject var viewModel : HomeViewModel = .init()
    
    var body: some View {
        NavigationView {
            VStack {
                Button {
                    viewModel.isSignOut = true
                    AuthManager.shared.signOut()
                    AuthManager.shared.userCheck = nil
                    DispatchQueue.main.asyncAfter(deadline: .now() + 3){
                        print("ID: \(String(describing: AuthManager.shared.userCheck))")
                    }
                } label: {
                    Text("Sign Out")
                }
                ZStack {
                    Image(Imagements.Main.homeView.rawValue)
                        .resizable()
                        .scaledToFit()
                    Rectangle()
                        .frame(height: 200)
                        .opacity(0.5)
                    Text("Bakım aşamasında 🚧")
                        .font(.largeTitle.bold())
                        .foregroundColor(.white)
                }
            }
        }
        .navigationDestination(isPresented: $viewModel.isSignOut) {
            SplashView()
                .navigationBarBackButtonHidden(true)
                .toolbar(.hidden, for: .tabBar)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

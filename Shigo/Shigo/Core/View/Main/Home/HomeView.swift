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
                NavigationLink {
                    SplashView()
                        .navigationBarBackButtonHidden(true)
                        .toolbar(.hidden, for: .tabBar)
                } label: {
                    Text("Sign Out")
                }
                .onTapGesture {
                    AuthManager.shared.signOut()
                    AuthManager.shared.userCheck = nil
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
            AuthCoordinatorView()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

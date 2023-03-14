//
//  HomeView.swift
//  Shigo
//
//  Created by NomoteteS on 10.03.2023.
//

import SwiftUI

struct HomeView: View {
        
    @ObservedObject var viewModel : HomeViewModel = .init()
    
    var body: some View {
        NavigationView {
            VStack {
                Button {
                    AuthManager.shared.signOut()
                    viewModel.isSignOut.toggle()
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
                    
                    Text("Not Ready Sorry For that")
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

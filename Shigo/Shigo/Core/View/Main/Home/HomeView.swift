//
//  HomeView.swift
//  Shigo
//
//  Created by NomoteteS on 10.03.2023.
//

import SwiftUI

struct HomeView: View {
        
    var body: some View {
        VStack {
            Button {
                AuthManager.shared.signOut()
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
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

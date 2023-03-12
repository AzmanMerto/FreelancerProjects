//
//  HomeView.swift
//  Shigo
//
//  Created by NomoteteS on 10.03.2023.
//

import SwiftUI

struct HomeView: View {
        
    var body: some View {
        ZStack {
            Image(Imagements.Main.homeView.rawValue)
                .resizable()
                .scaledToFit()
            
            Rectangle()
                .ignoresSafeArea()
                .opacity(0.5)
            
            Text("Not Ready Sorry For that")
                .font(.largeTitle.bold())
                .foregroundColor(.white)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

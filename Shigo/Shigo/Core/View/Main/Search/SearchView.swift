//
//  SearchView.swift
//  Shigo
//
//  Created by NomoteteS on 10.03.2023.
//

import SwiftUI

struct SearchView: View {
    var body: some View {
        ZStack {
            Image(Imagements.Main.searchView.rawValue)
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

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}

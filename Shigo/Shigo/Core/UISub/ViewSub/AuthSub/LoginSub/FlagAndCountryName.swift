//
//  FlagAndCountryName.swift
//  Shigo
//
//  Created by NomoteteS on 5.03.2023.
//

import SwiftUI

struct FlagAndCountryName: View {
    var body: some View {
        VStack {
            HStack(spacing: 50) {
                Image(Imagements.Auth.german.rawValue)
                    .flag()
                
                Image(Imagements.Auth.turkey.rawValue)
                    .flag()
            }
            ZStack {
                Rectangle()
                    .foregroundColor(.shigoPurple)
                    .frame(height: 50)
                Text("Termin - Görüşme")
                    .font(.largeTitle.bold())
                    .foregroundColor(.white)
                
            }
        }
        .padding(.top)
    }
}

struct FlagAndCountryName_Previews: PreviewProvider {
    static var previews: some View {
        FlagAndCountryName()
    }
}

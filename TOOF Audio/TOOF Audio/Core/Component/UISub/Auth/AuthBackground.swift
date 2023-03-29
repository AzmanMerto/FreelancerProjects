//
//  AuthBackground.swift
//  TOOF Audio
//
//  Created by NomoteteS on 28.03.2023.
//

import SwiftUI

struct AuthBackground: View {
    var body: some View {
        ZStack {
            Image(ImageHelper.auth.authBackground.rawValue)
                .ignoresSafeArea()
                .frame(width: UIScreen.main.bounds.width * 1)
        }
    }
}

struct AuthBackground_Previews: PreviewProvider {
    static var previews: some View {
        AuthBackground()
    }
}

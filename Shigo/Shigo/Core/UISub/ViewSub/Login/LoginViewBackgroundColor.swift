//
//  LoginViewBackgroundColor.swift
//  Shigo
//
//  Created by NomoteteS on 5.03.2023.
//

import SwiftUI

struct LoginViewBackgroundColor: View {
    var body: some View {
        VStack {
            Rectangle()
                .foregroundColor(.white)
            Rectangle()
                .foregroundColor(.shigoPurple)
        }
        .ignoresSafeArea()
    }
}

struct LoginViewBackgroundColor_Previews: PreviewProvider {
    static var previews: some View {
        LoginViewBackgroundColor()
    }
}

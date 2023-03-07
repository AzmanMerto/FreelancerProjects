//
//  AuthLoginView.swift
//  TOOF Audio
//
//  Created by NomoteteS on 7.03.2023.
//

import SwiftUI

struct AuthLoginView: View {
    var body: some View {
        ZStack {
            Image.AuthBackground
                .ignoresSafeArea()
            VStack {
                EntryHeader()
            }
        }
    }
}

struct AuthLoginView_Previews: PreviewProvider {
    static var previews: some View {
        AuthLoginView()
    }
}

//
//  splashFastView.swift
//  TOOF Audio
//
//  Created by NomoteteS on 18.04.2023.
//

import SwiftUI

struct splashFastView: View {
    var body: some View {
        ZStack {
            Color.ToofPrimaryColorAlt
                .ignoresSafeArea()
            Image(ImageHelper.app.appLogo.rawValue)
                .resizable()
                .scaledToFit()
                .frame(width: dw(0.6))
        }
    }
}

struct splashFastView_Previews: PreviewProvider {
    static var previews: some View {
        splashFastView()
    }
}

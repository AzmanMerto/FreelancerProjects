//
//  SettingsView.swift
//  TOOF Audio
//
//  Created by NomoteteS on 29.03.2023.
//

import SwiftUI

struct SettingsView: View {
    
    @ObservedObject var viewModel: MainViewModel = .init()

    var body: some View {
        ZStack {
            Color.ToofBackgroundColor
                .ignoresSafeArea()
            VStack {
                
            }
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}

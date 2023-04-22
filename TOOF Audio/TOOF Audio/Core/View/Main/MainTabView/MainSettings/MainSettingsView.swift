//
//  MainSettingsView.swift
//  TOOF Audio
//
//  Created by NomoteteS on 20.04.2023.
//

import SwiftUI

struct MainSettingsView: View {
    
    @ObservedObject var viewModel : MainSettingsViewModel
    
    var body: some View {
        ZStack {
            Color.ToofBackgroundColor.ignoresSafeArea()
            VStack {
                mainHeader(title: TextHelper.main.mainSettingsTitle.rawValue)
                
                ForEach(viewModel.settingsListItems , id: \.id) { data in
                    ToofList(customList: data) {
                        if let viewState = data.viewOpen as? MainSettingsViewModel.ViewState {
                            if viewState == .logout{
                                viewModel.settingsViewSection = viewState
                                viewModel.signOut()
                            }else {
                                viewModel.settingsViewSection = viewState
                            }
                        }
                    }
                }
                Spacer()
            }
            .fullScreenCover(item: $viewModel.settingsViewSection) { view in
                switch view {
                case .account:
                    SettingsAccountView(viewModel: .init(user: viewModel.user))
                case .support:
                    SettingsHelpView(viewModel: .init())
                case .logout:
                    SplashView()
                }
            }
        }
    }
}

struct MainSettingsView_Previews: PreviewProvider {
    static var previews: some View {
        MainSettingsView(viewModel: .init(user: User()))
    }
}

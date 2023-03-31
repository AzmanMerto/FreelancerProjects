//
//  EQView.swift
//  TOOF Audio
//
//  Created by NomoteteS on 31.03.2023.
//

import SwiftUI

struct EQView: View {
    
    @ObservedObject var viewModel: MainViewModel = .init()
    
    var body: some View {
        ZStack {
            Color.ToofBackgroundColor
                .ignoresSafeArea()
            VStack {
                //TODO: Connect values to device
                MainTitleAndBack(isBackButtonShowing: true, title: TextHelper.main.mainDeviceSettingsEQ.rawValue)
                Spacer()
                VStack(spacing: 40) {
                    SliderValue(text: TextHelper.main.mainDeviceSettingsEqTrable.rawValue, value: viewModel.trableValue)
                    
                    SliderValue(text: TextHelper.main.mainDeviceSettingsEqBass.rawValue, value: viewModel.bassValue)
                }
                Spacer()
                Spacer()
            }
        }
    }
}

struct EQView_Previews: PreviewProvider {
    static var previews: some View {
        EQView()
    }
}



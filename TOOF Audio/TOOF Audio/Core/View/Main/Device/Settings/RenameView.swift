//
//  RenameView.swift
//  TOOF Audio
//
//  Created by NomoteteS on 31.03.2023.
//

import SwiftUI

struct RenameView: View {
    
    @ObservedObject var viewModel: MainViewModel = .init()
    var deviceName: String
    
    var body: some View {
        ZStack {
            Color.ToofBackgroundColor
                .ignoresSafeArea()
            VStack {
                MainTitleAndBack(isBackButtonShowing: true,title: TextHelper.main.mainDeviceSettingsRenameDevice.rawValue)
                
                Spacer()
                
                EntryTextField(isSecure: false, isActive: false, placeholderText: deviceName, bindingText: .constant(""))
                    .padding(.horizontal,40)
                    .overlay {
                        Text(TextHelper.main.mainDeviceSettingsRenameRenamed.rawValue.locale())
                            .foregroundColor(.ToofTextColor)
                            .font(.boldRounded14)
                            .offset(x: -120,y:-40)
                    }
                
                Spacer()
                
                PrimaryButton(text: TextHelper.main.mainDeviceSettingsRenameButton.rawValue) {
                    
                }
                Spacer()
            }
        }
    }
}

struct RenameView_Previews: PreviewProvider {
    static var previews: some View {
        RenameView(deviceName: "")
    }
}

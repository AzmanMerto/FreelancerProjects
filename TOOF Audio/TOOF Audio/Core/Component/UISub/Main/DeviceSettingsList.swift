//
//  DeviceSettingsList.swift
//  TOOF Audio
//
//  Created by NomoteteS on 30.03.2023.
//

import SwiftUI

struct DeviceSettingsList: View {
    
    var image: String
    var text: String
    var action: () -> ()
    
    var body: some View {
        VStack {
            Button(action: {
                action()
            }, label: {
                HStack {
                    Image(image)
                        .resizable()
                        .scaledToFit()
                        .background{
                            Circle()
                                .foregroundColor(.ToofTextColor)
                                .padding(.all,-7)
                        }
                        .frame(width: 35)
                    Text(text.locale())
                        .bold()
                        .foregroundColor(.ToofTextColor)
                        .padding(.leading)
                    Spacer()
                    
                    Image(ImageHelper.main.rightArrow.rawValue)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 12)
                }
                .padding(.horizontal,30)
            })
            Rectangle().frame(height: 1).foregroundColor(.ToofTextColor)
        }
    }
}


struct DeviceSettingsList_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.ToofBackgroundColor
                .ignoresSafeArea()
            DeviceSettingsList(image: ImageHelper.main.alarmIcon.rawValue,
                               text: TextHelper.main.mainDeviceSettingsRenameDevice.rawValue){
                
            }
        }
    }
}

//
//  ContentView.swift
//  TOOF Audio
//
//  Created by NomoteteS on 31.03.2023.
//

import SwiftUI

struct ContentView: View {
    
    var deviceName: String
    
    var body: some View {
        ZStack {
            Color.ToofBackgroundColor
                .ignoresSafeArea()
            VStack {
                MainTitleAndBack(isBackButtonShowing: true, title: TextHelper.main.mainDeviceSettingsCustomContent.rawValue)
                Spacer()
                //MARK: ContentView - Header
                VStack(alignment: .leading, spacing: 5) {
                    Text(TextHelper.main.mainDeviceSettingsCustomContentSpecify.rawValue.locale())
                        .font(.semiDefault20)
                    Text(TextHelper.main.mainDeviceSettingsCustomContentDescription.rawValue.locale())
                        .font(.reguDefault14)
                }
                .foregroundColor(.ToofTextColor)
                //MARK: ContentView - Custom Buttons
                VStack {
                    HStack {
                        Text(deviceName)
                            .foregroundColor(.ToofTextColor)
                            .font(.semiDefault20)
                        
                        Spacer()
                        PrimaryButton(text: TextHelper.main.mainDeviceSettingsCustomContentButton.rawValue,
                                      size: CGSize(width: 100, height: 22),
                                      textColor: Color.ToofButtonColor,
                                      backgroundColor: Color.ToofTextColor) {
                            //TODO: Save changes
                        }
                                      .padding(.trailing,20)
                    }
                    ScrollView(.vertical) {
                        ForEach(1...10, id:\.self) { value in
                            VStack {
                                ZStack {
                                    Rectangle()
                                        .foregroundColor(.ToofPlaceholder)
                                        .frame(height: 20)
                                    HStack{
                                        Text("\(value). ")
                                        +
                                        Text(TextHelper.main.mainDeviceSettingsCustomContentSetContent.rawValue.locale())
                                    }
                                    .font(.boldRounded14)
                                    .foregroundColor(.ToofTextColor)
                                }
                                
                                Text(TextHelper.main.mainDeviceSettingsCustomContentSetContent.rawValue.locale())
                                    .font(.boldRounded14)
                                    .foregroundColor(.ToofPlaceholder)
                            }
                        }
                    }
                }
                .padding(.horizontal,20)
                
                
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(deviceName: "Mutfak")
    }
}

//
//  AlarmView.swift
//  TOOF Audio
//
//  Created by NomoteteS on 31.03.2023.
//

import SwiftUI

struct AlarmView: View {
    
    @ObservedObject var viewModel: MainViewModel = .init()
    
    var body: some View {
        ZStack {
            Color.ToofBackgroundColor
                .ignoresSafeArea()
            VStack {
                ZStack {
                    MainTitleAndBack(isBackButtonShowing: true, title: TextHelper.main.mainDeviceSettingsAlarm.rawValue)
                    HStack {
                        Spacer()
                        Button {
                            //TODO: Add alarm
                        } label: {
                            Text("+")
                                .font(.semiDefault20)
                                .foregroundColor(.ToofButtonColor)
                        }
                        .padding(EdgeInsets(top: 30, leading: 0, bottom: 0, trailing: 10))
                    }
                }
                Spacer()
                VStack {
                    if !viewModel.isUserSetUpAlarm {
                        Image(ImageHelper.main.alarmObject.rawValue)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 174)
                        
                        Text(TextHelper.main.mainDeviceSettingsAlarmNotyetAlarm.rawValue.locale())
                            .font(.boldDefault25)
                            .foregroundColor(.ToofTextColor)
                            .padding(.vertical,40)
                        
                        Text(TextHelper.main.mainDeviceSettingsAlarmAddAlarm.rawValue.locale())
                            .font(.boldRounded14)
                            .foregroundColor(.ToofTextColor)
                    }
                }
                .padding(.horizontal,60)
                .multilineTextAlignment(.center)
                Spacer()
            }
        }
    }
}

struct AlarmView_Previews: PreviewProvider {
    static var previews: some View {
        AlarmView()
    }
}

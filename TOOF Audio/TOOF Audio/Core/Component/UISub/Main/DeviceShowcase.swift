//
//  DeviceShowcase.swift
//  TOOF Audio
//
//  Created by NomoteteS on 30.03.2023.
//

import SwiftUI

struct DeviceShowcase: View {
    
    @Binding var isPlaying: Bool
    @Binding var deviceVolume: Float
    var deviceTitle: String
    var musicName: String
    
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    //MARK: DeviceShowcase - Device Title
                    Text(deviceTitle)
                        .foregroundColor(.ToofTextColor)
                        .font(.semiDefault20)
                    //MARK: DeviceShowcase - Playing String
                    HStack {
                        Text(isPlaying ? TextHelper.main.mainDevicePlaying.rawValue.locale() : TextHelper.main.mainDeviceNotPlaying.rawValue.locale())
                        
                        Text(musicName)
                            .foregroundColor(.ToofButtonColor)
                    }
                }
                Spacer()
                //MARK: DeviceShowcase - Device Settings
                NavigationLink {
                    
                } label: {
                    Image(ImageHelper.main.wheel.rawValue)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20)
                }
                
            }
            .padding(.horizontal)
            
            Image(ImageHelper.main.deviceImage.rawValue)
                .resizable()
                .scaledToFit()
                .frame(height: 200)
                .background {
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.ToofTextSoftColor, lineWidth: 1)
                }
                .padding(.vertical)
            HStack {
                Image(ImageHelper.main.speaker.rawValue)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 20)
                
                Slider(value: .constant(2), in: 0...100)
                    
            }
            .foregroundColor(.red)
            .padding(.horizontal)
        }
    }
}


struct DeviceShowcase_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.ToofBackgroundColor
                .ignoresSafeArea()
            DeviceShowcase(isPlaying: .constant(false), deviceVolume: .constant(0), deviceTitle: "kjkj", musicName: "")
        }
    }
}

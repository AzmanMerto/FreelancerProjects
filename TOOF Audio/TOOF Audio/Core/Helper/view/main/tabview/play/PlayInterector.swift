//
//  PlayInterector.swift
//  TOOF Audio
//
//  Created by NomoteteS on 23.04.2023.
//

import SwiftUI

struct PlayInterector: View {
    
    @Binding var isRandom: Bool
    @State var rotateSection: Int
    @State var deviceName: String
    
    var body: some View {
            HStack {
                Text("Cihaz:\(deviceName)")
                    .font(.default20).bold()
                    .foregroundColor(.ToofTextColor)
                    .background {
                        RoundedRectangle(cornerRadius: 20)
                            .padding(.horizontal,-10)
                            .foregroundColor(.ToofPrimaryColorAlt)
                    }
                
                Spacer()
                
                Image(isRandom ? ImageHelper.player.randomIconFilled.rawValue : ImageHelper.player.randomIcon.rawValue)
                    .resizable()
                    .background {
                        RoundedRectangle(cornerRadius: 5)
                            .foregroundColor(.ToofTextSoftColor)
                            .padding(.all,-4)
                            .opacity(0.5)
                    }
                    .scaledToFit()
                    .frame(height: dh(0.03))
                    .onTapGesture {
                        isRandom.toggle()
                        //TODO: Random music list
                    }
                    .padding(.trailing,dw(0.05))
                
                Image("Rotate\(rotateSection)")
                    .resizable()
                    .background {
                        RoundedRectangle(cornerRadius: 5)
                            .foregroundColor(.ToofTextSoftColor)
                            .padding(.all,-4)
                            .opacity(0.5)
                    }
                    .scaledToFit()
                    .frame(height: dh(0.03))
                    .onTapGesture {
                        rotateSection = (rotateSection % 3) + 1
                    }
            }
    }
}

struct PlayInterector_Previews: PreviewProvider {
    static var previews: some View {
        PlayInterector(isRandom: .constant(false), rotateSection: 1, deviceName: "")
    }
}

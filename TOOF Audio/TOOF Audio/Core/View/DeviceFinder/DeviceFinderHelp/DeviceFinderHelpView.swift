//
//  DeviceFinderHelpView.swift
//  TOOF Audio
//
//  Created by NomoteteS on 19.04.2023.
//

import SwiftUI

struct DeviceFinderHelpView: View {
    
    @ObservedObject var viewModel = DeviceFinderHelpViewModel()
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {
            Color.ToofBackgroundColor.ignoresSafeArea()
            VStack {
                Spacer()
                Text(TextHelper.deviceFinder.deviceFinderSearchHelpTitle.rawValue.locale())
                    .font(.default20)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.ToofTextColor)
                    .padding(.horizontal,dw(0.1))
                Spacer()
                HStack {
                    Image(ImageHelper.deviceFinder.line.rawValue)
                        .resizable()
                        .scaledToFit()
                        .padding(.leading,dw(0.1))
                                        
                    VStack(alignment: .leading, spacing: dh(0.065)){
                        ForEach(viewModel.helpItems, id:\.text) { data in
                            Text(data.text.locale())
                                .foregroundColor(.ToofTextColor)
                        }
                    }
                    .padding(.horizontal)
                    Spacer()
                }
                .frame(height: dh(0.3))
                .padding(.horizontal,dw(0.02))
                
                Spacer()
                ToofButton(buttonText: TextHelper.deviceFinder.deviceFinderSearchHelpButton.rawValue) {
                    
                }
                Spacer()
            }
        }
    }
}

struct DeviceFinderHelpView_Previews: PreviewProvider {
    static var previews: some View {
        DeviceFinderHelpView()
    }
}

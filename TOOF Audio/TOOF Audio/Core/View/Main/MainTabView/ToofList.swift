//
//  ToofList.swift
//  TOOF Audio
//
//  Created by NomoteteS on 21.04.2023.
//

import SwiftUI

struct ToofList: View {
    
    var customList: CustomListModel
    var action: () -> ()
    
    var body: some View {
        VStack {
            Button {
                action()
            } label: {
                VStack(spacing: 0) {
                    HStack {
                        Circle()
                            .foregroundColor(.ToofTextColor)
                            .overlay {
                                //MARK: ToofList - Image
                                Image(customList.imageString)
                                    .resizable()
                                    .scaledToFit()
                                    .padding(.all,8)
                            }
                        //MARK: ToofList - Button Text
                        Text(customList.buttonText.locale())
                            .font(.default17).bold()
                            .foregroundColor(.ToofTextColor)
                            .padding(.leading)
                        Spacer()
                        //MARK: ToofList - Arrow
                        Image(ImageHelper.main.rightArrow.rawValue)
                            .resizable()
                            .scaledToFit()
                            .frame(width: dw(0.035))
                    }
                    .frame(height: dh(0.066))
                    .padding(.horizontal)
                    line()
                }
            }
        }
        .padding(.horizontal)
    }
}

struct ToofList_Previews: PreviewProvider {
    static var previews: some View {
        
        let customListModelItems: CustomListModel = CustomListModel(id: 0,
                                                                    imageString: ImageHelper.main.renameIcon.rawValue,
                                                                    buttonText: TextHelper.main.mainDeviceSettingsEQ.rawValue)
        
        ZStack {
            Color.ToofBackgroundColor.ignoresSafeArea()
            ToofList(customList: customListModelItems) {
                
            }
        }
    }
}

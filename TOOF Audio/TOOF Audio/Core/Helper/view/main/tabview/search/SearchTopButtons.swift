//
//  SearchTopButtons.swift
//  TOOF Audio
//
//  Created by NomoteteS on 26.04.2023.
//

import SwiftUI

struct SearchTopButtons: View {

    @Binding var isUserHaveAppleMusicSubs: Bool
    var refreshButton: () -> ()
    var appleButton: () -> ()
    var addButton: () -> ()
    
    var body: some View {
        ZStack {
            mainHeader(title: TextHelper.main.mainSearchTitle.rawValue)
            HStack {
                Button {
                    refreshButton()
                } label: {
                    Image(systemName: "gobackward")
                }
                Spacer()
                Button {
                    appleButton()
                } label: {
                    Image(systemName: "applelogo")
                }
                .hideAndDisableButton(isUserHaveAppleMusicSubs)
                .padding(.horizontal)
                Button {
                    addButton()
                } label: {
                    Image(systemName: "plus.rectangle.fill.on.rectangle.fill")
                }
            }
            .padding(.horizontal)
            .font(.default20)
            .foregroundColor(.ToofButtonColor)
        }
        .padding(.top)
    }
}

struct SearchTopButtons_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.ToofBackgroundColor.ignoresSafeArea()
            SearchTopButtons(isUserHaveAppleMusicSubs: .constant(false)) {
                
            } appleButton: {
                
            } addButton: {
                
            }

        }
    }
}


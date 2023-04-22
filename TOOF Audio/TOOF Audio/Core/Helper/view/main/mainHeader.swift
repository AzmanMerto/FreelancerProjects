//
//  mainHeader.swift
//  TOOF Audio
//
//  Created by NomoteteS on 20.04.2023.
//

import SwiftUI

struct mainHeader: View {
    
    var title: String
    var isShowButton: Bool?
    
    var body: some View {
        ZStack {
            Text(title.locale())
                .font(.default20).bold()
                .foregroundColor(.ToofTextColor)
            HStack {
                if isShowButton != nil {
                    ToofBackButton()
                }
                Spacer()
            }
        }
        .padding(EdgeInsets(top: dw(0.05), leading: dw(0.05), bottom: dw(0.1), trailing: dw(0.05)))
    }
}

struct mainHeader_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.ToofBackgroundColor.ignoresSafeArea()
            mainHeader(title: "Title")
        }
    }
}

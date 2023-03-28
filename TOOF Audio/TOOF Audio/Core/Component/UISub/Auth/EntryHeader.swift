//
//  EntryHeader.swift
//  TOOF Audio
//
//  Created by NomoteteS on 7.03.2023.
//

import SwiftUI

struct EntryHeader: View {
    
    var title: String
    var description: String
    
    var body: some View {
        VStack {
            Image(ImageHelper.app.toofLogo.rawValue)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200)
                .padding(.bottom,80)
            HStack{
                VStack(alignment: .leading,spacing: 10) {
                    Text(title.locale())
                        .font(.semiDefault20.bold())
                    
                    Text(description.locale())
                        .font(.reRounded16)
                }
                Spacer()
            }
            .padding(.horizontal)
            .foregroundColor(.ToofTextColor)
        }
    }
}

struct EntryHeader_Previews: PreviewProvider {
    static var previews: some View {
        ZStack{
            Color.ToofBackgroundColor
                .ignoresSafeArea()
            EntryHeader(title: "Başlık",
                        description: "Açıklama")
        }
    }
}

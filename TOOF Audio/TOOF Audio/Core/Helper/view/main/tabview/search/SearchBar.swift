//
//  SearchBar.swift
//  TOOF Audio
//
//  Created by NomoteteS on 23.04.2023.
//

import SwiftUI

struct SearchBar: View {
    
    @Binding var searchText: String
    
    var body: some View {
        HStack {
            Image(ImageHelper.main.searchIconRed.rawValue)
                .resizable()
                .scaledToFit()
                .frame(width: 20)
            TextField("", text: $searchText)
                .foregroundColor(.ToofTextColor)
                .font(.default15)
                .background {
                    HStack {
                        Text(TextHelper.main.mainSearchSearchBar.rawValue.locale())
                            .foregroundColor(.ToofTextColor)
                            .font(.default15)
                        Spacer()
                    }
                    .opacity(searchText.count > 0 ? 0 : 1)
                }
        }
        .padding(.leading)
        .background {
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.ToofTextColor)
                .padding(.vertical,-10)
        }
        .padding(.horizontal,30)
        
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar(searchText: .constant(""))
    }
}
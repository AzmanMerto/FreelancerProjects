//
//  TabBar.swift
//  Shigo
//
//  Created by NomoteteS on 10.03.2023.
//

import SwiftUI


struct TabBar: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 40)
                .foregroundColor(.shigoTextGray)
            HStack {
                Spacer()
                TabButton(isChanged: .constant(false), systemImage: "house") {
                    
                }
                Spacer()
                TabButton(isChanged: .constant(false), systemImage: "magnifyingglass") {
                    
                }
                Spacer()
                Button {
                    
                } label: {
                    Image("")
                }

                Spacer()
                TabButton(isChanged: .constant(false), systemImage: "basket") {
                    
                }
                
                Spacer()
                TabButton(isChanged: .constant(false), systemImage: "person.circle") {
                    
                }
                Spacer()
            }
        }
        .padding(.horizontal)
        .frame(height: 70)
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}

private struct TabButton: View {
    
    @Binding var isChanged : Bool
    var systemImage: String
    var action: () -> ()
    
    var body: some View {
        Button {
            action()
        } label: {
            Image(systemName: systemImage)
        }
        .tint(isChanged ? Color.shigoOrange : Color.shigoDarkTextGray)
    }
}


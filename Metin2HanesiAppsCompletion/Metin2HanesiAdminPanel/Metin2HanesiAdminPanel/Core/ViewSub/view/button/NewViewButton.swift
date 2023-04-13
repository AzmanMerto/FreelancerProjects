//
//  NewViewButton.swift
//  Metin2HanesiAdminPanel
//
//  Created by NomoteteS on 19.03.2023.
//

import SwiftUI

struct NewViewButton: View {
    
    var buttonName: String
    var action: () -> ()
    
    var body: some View {
        Button {
            action()
        } label: {
            Text(buttonName)
                .font(.body.bold())
        }
        .buttonStyle(NewViewButtonStyle())
    }
}

struct NewViewButton_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.MetinBackground
                .ignoresSafeArea()
            NewViewButton(buttonName: "first"){
                
            }
        }
    }
}

private struct NewViewButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.MetinYellow,lineWidth: 5)
                .overlay {
                    Color.MetinBackground
                        .cornerRadius(20)
                }
            configuration.label
                .foregroundColor(.MetinYellow)
        }
        .padding(.horizontal)
        .frame(height: 50)

    }
}

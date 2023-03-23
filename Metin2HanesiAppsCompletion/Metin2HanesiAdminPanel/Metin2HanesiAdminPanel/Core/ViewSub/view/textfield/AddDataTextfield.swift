//
//  AddDataTextfield.swift
//  Metin2HanesiAdminPanel
//
//  Created by NomoteteS on 22.03.2023.
//

import SwiftUI

struct AddDataTextfield: View {
    
    var text: String
    @Binding var textData: String
    
    var body: some View {
        VStack {
            HStack {
                Text(text)
                    .foregroundColor(.MetinYellow)
                Spacer()
            }
            .padding(.all)
            TextField("", text: $textData)
                .foregroundColor(.MetinYellow)
                .padding(.horizontal)
                .background {
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.MetinYellow, lineWidth: 3)
                        .padding(.vertical,-20)
                        .background {
                            Color.MetinBackground
                                .cornerRadius(20)
                                .padding(.vertical,-20)
                        }
                }
                .tint(.MetinYellow)
                .font(.body.bold())
        }
        .frame(height: 60)
        .padding(.horizontal)
    }
}

struct AddDataTextfield_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.MetinBackground
                .ignoresSafeArea()
            AddDataTextfield(text: "Helrkjeakjr", textData: .constant(""))
        }
    }
}

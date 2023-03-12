//
//  SecureCustomTextField.swift
//  Shigo
//
//  Created by NomoteteS on 12.03.2023.
//

import SwiftUI

struct SecureCustomTextField: View {
    
    var text : String
    @Binding var textField: String
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 2)
                .frame(height: 50)
                .padding(.horizontal)
                .foregroundColor(.shigoTextGray)
            HStack {
                SecureField(text, text: $textField)
                .foregroundColor(.black)
                .padding(.horizontal)
                Spacer()
            }
            .padding(.horizontal)
        }
    }
}

struct SecureCustomTextField_Previews: PreviewProvider {
    static var previews: some View {
        SecureCustomTextField(text: "", textField: .constant(""))
    }
}

//
//  CustomTextField.swift
//  Shigo
//
//  Created by NomoteteS on 4.03.2023.
//

import SwiftUI

struct CustomTextField: View {
    
    var text : String
    @Binding var textField: String
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 2)
                .frame(height: 50)
                .padding(.horizontal)
                .foregroundColor(.gray.opacity(0.4))
            HStack {
                TextField(text, text: $textField)
                Spacer()
            }
            .padding(.horizontal)
            .padding(.horizontal)
        }
    }
}

struct CustomTextField_Previews: PreviewProvider {
    static var previews: some View {
        CustomTextField(text: "Email",textField: .constant(""))
    }
}

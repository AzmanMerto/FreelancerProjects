//
//  ToofTextField.swift
//  TOOF Audio
//
//  Created by NomoteteS on 19.04.2023.
//

import SwiftUI

struct ToofTextField: View {
    
    @Binding var textField: String
    var isSecure: Bool?
    var placeholder: String
    
    var body: some View {
        ZStack {
            //MARK: ToofTextField - Placeholder
            HStack {
                if textField.isEmpty {
                    Text(placeholder.locale())
                        .font(.default16)
                        .foregroundColor(.ToofPlaceholder)
                }
                Spacer()
            }
            .padding(.leading)
            //MARK: ToofTextField - TextFields
            if isSecure ?? false {
                SecureField("", text: $textField)
                    .foregroundColor(.ToofTextColor)
                    .padding(.leading)
            }else {
                TextField("", text: $textField)
                    .foregroundColor(.ToofTextColor)
                    .padding(.leading)
            }
        }
        .background {
            //MARK: ToofTextField - Background
            RoundedRectangle(cornerRadius: 10)
                .stroke()
                .foregroundColor(.ToofTextColor)
                .padding(.vertical,-15)
            
        }
        .frame(height: 60)
        .padding(.horizontal, dh(0.02))
    }
}

struct ToofTextField_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            authBackground()
            ToofTextField(textField: .constant(""), placeholder: "Placeholder")
        }
    }
}

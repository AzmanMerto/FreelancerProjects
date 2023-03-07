//
//  EntryTextField.swift
//  TOOF Audio
//
//  Created by NomoteteS on 7.03.2023.
//

import SwiftUI

struct EntryTextField: View {
    @Binding var text: String
    var body: some View {
        TextField("", text: $text)
    }
}

struct EntryTextField_Previews: PreviewProvider {
    static var previews: some View {
        EntryTextField(text: .constant(""))
    }
}

//
//  CustomTextField.swift
//  Shigo
//
//  Created by NomoteteS on 4.03.2023.
//

import SwiftUI

struct CustomTextField: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 2)
                .frame(height: 50)
                .padding(.horizontal)
        }
    }
}

struct CustomTextField_Previews: PreviewProvider {
    static var previews: some View {
        CustomTextField()
    }
}

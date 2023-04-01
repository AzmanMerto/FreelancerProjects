//
//  String+Extension.swift
//  TOOF Audio
//
//  Created by NomoteteS on 27.03.2023.
//

import SwiftUI

extension String {
    func locale() -> LocalizedStringKey {
        return LocalizedStringKey(self)
    }
    
    func isValidEmail() -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        return NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: self)
    }
}

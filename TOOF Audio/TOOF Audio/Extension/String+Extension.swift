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
}

//
//  FontHandler.swift
//  TOOF Audio
//
//  Created by NomoteteS on 7.03.2023.
//

import SwiftUI

extension Font {
    
    //MARK: Font Default - Semibold
    static let semiDefault20 : Font = .system(.title3, design: .default, weight: .semibold)
    
    //MARK: Font Default - Bold
    static let boldDefault25 : Font = .system(.title2,design: .default, weight: .bold)
    
    //MARK: Font Rounded - Regular
    
    //MARK: - Regular
    static let reRounded16 : Font = .system(.callout, design: .rounded, weight: .regular)
    
    //MARK: - Bold
    static let boldRounded14 : Font = .system(.footnote, design: .rounded, weight: .bold)
}

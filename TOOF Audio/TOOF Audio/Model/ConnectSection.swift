//
//  ConnectSection.swift
//  TOOF Audio
//
//  Created by NomoteteS on 20.04.2023.
//

import Foundation

struct ConnectSection: Identifiable, Equatable {
    let id = UUID()
    let connectString: String
    let tag: Int
    
    static func == (lhs: ConnectSection, rhs: ConnectSection) -> Bool {
        return lhs.id == rhs.id
    }
}

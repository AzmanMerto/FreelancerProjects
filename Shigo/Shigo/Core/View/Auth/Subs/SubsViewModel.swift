//
//  SubsViewModel.swift
//  Shigo
//
//  Created by Mert Türedü on 1.06.2023.
//

import Foundation

class SubsViewModel: ObservableObject {
 
    @Published var isSubs: Bool
    @Published var navigateToMain: Bool = false
    
    init(isSubs: Bool = false) {
        self.isSubs = isSubs
    }
    
}

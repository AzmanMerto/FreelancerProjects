//
//  RegisterView.swift
//  Shigo
//
//  Created by NomoteteS on 5.03.2023.
//

import SwiftUI

struct RegisterView: View {
    
    @StateObject var viewModel: RegisterViewModel = .init()
    @EnvironmentObject var coordinator : PrimaryCoordinator
    
    var body: some View {
        Button("Dismiss") {
            coordinator.push(.loginView)
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}

//
//  AdminViewHeader.swift
//  Metin2HanesiAdminPanel
//
//  Created by NomoteteS on 22.03.2023.
//

import SwiftUI

struct AdminViewHeader: View {
    var body: some View {
        VStack {
            Image("Logo")
                .resizable()
                .scaledToFit()
                .frame(height: 150)
                .padding(.horizontal)
            Text("Aşağıdaki buttonlar sayesinde uygulamanıza sunucu listesi ekleyebilirsiniz.")
                .font(.title3)
                .foregroundColor(.MetinYellow)
                .padding(.horizontal)
                .multilineTextAlignment(.center)
        }
        .padding(.bottom)
    }
}


struct AdminViewHeader_Previews: PreviewProvider {
    static var previews: some View {
        AdminViewHeader()
    }
}

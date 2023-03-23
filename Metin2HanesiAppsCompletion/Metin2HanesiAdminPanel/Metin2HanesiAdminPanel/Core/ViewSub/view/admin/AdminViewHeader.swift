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
                .frame(height: 150)
                .padding(.horizontal)
            Text("Aşağıdaki buttonlar sayesinde uygulamanıza \nsunucu listesi ekleyebilirsiniz.")
                .font(.title3.bold())
                .foregroundColor(.MetinYellow)
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

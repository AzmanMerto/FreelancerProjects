//
//  AdminView.swift
//  Metin2HanesiAdminPanel
//
//  Created by NomoteteS on 19.03.2023.
//

import SwiftUI

struct AdminView: View {
    
    @ObservedObject var viewModel: AdminViewModel = .init()
    
    var body: some View {
        ZStack {
            Color.MetinBackground
                .ignoresSafeArea()
            VStack {
                
                Image("Logo")
                    .resizable()
                    .frame(height: 100)
                
                //MARK: AdminView - Title
                Text("Aşağıdaki buttonlar sayesinde uygulamanıza \nsunucu listesi ekleyebilirsiniz.")
                    .font(.title3.bold())
                    .foregroundColor(.MetinYellow)
                    .multilineTextAlignment(.center)
                Spacer()
                //MARK: AdminView - Buttons
                ForEach(viewModel.AddDataServerModelItems, id: \.buttonTitle) { data in
                    NewViewButton(buttonName: data.buttonTitle) {
                        
                    }
                    .padding(.bottom)
                }
            }
        }
    }
}

struct AdminView_Previews: PreviewProvider {
    static var previews: some View {
        AdminView()
    }
}

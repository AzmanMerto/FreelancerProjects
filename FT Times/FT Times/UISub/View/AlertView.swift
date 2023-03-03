//
//  AlertView.swift
//  FT Times
//
//  Created by NomoteteS on 3.03.2023.
//

import SwiftUI

struct AlertView: View {
    
    @Binding var isShowAlert: Bool
    @Binding var isPlus : Bool
    var action5: () -> ()
    var action10: () -> ()
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .stroke(lineWidth: 2)
            ZStack {
                Color.white
                VStack(alignment: .leading) {
                    // MARK: AllertView Title
                    HStack {
                        Image(systemName: "plus.circle.fill")
                            .foregroundColor(.yellow)
                        Text("Kronometre Kontrol")
                        
                        Spacer()
                    }
                    .font(.system(.title3).bold())
                    .padding(.vertical,5)
                    
                    // MARK: AllertView Text
                    Text("Mob geç çıkıyor ise kullanın.")
                    Text("Kaç milisaniye ileri alınsın ?")
                    Text("1000 milisaniye = 1 saniye")
                    Text("500 milisaniye = 0.5 saniye")
                    
                    // MARK: AllertView Buttons
                    HStack {
                        Button {
                            isShowAlert.toggle()
                        } label: {
                            Text("İptal")
                        }
                        
                        Spacer()
                        
                        HStack{
                            Button {
                                action5()
                            } label: {
                                Text(isPlus ? "+500ms" : "-500ms")
                            }
                            
                            Button {
                                action10()
                            } label: {
                                Text(isPlus ? "+1000ms" : "-1000ms")
                            }
                        }
                        .padding(.horizontal)
                    }
                    .padding(.vertical,10)
                }
                .padding(.leading)
            }
            .cornerRadius(10)
        }
        .frame(width: 300,height: 200)
    }
}

struct AllertView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.pink
                .ignoresSafeArea()
            AlertView(isShowAlert: .constant(false),isPlus: .constant(false)) {
                
            } action10: {
                
            }

        }
    }
}

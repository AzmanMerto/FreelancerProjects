//
//  PopView.swift
//  Metin2Hanesi
//
//  Created by NomoteteS on 15.04.2023.
//

import SwiftUI

struct PopView: View {
    
    @Binding var isShowed: Bool
    
    var body: some View {
        ZStack{
            Color.MetinBackground.opacity(0.8).ignoresSafeArea()
                .onTapGesture {
                    isShowed.toggle()
                }
            VStack(spacing: 30) {
                HeaderForAlternativeView(isShowing: $isShowed, text: "Detay Ekranı")
                Spacer()
                popButton(text: "İletişim") {
                    
                }
                popButton(text: "Yayıncılar") {
                    
                }
                popButton(text: "Reklam Yüzleri") {
                    
                }
                Spacer()
                Spacer()
            }
            .background(content: {
                RoundedRectangle(cornerRadius: 30)
                    .stroke(Color.MetinYellow, lineWidth: 0.3)
                    .padding(.all,-20)
                    .background {
                        Color.MetinBackground.cornerRadius(30).padding(.all,-20)

                    }
            })
            .frame(width: UIScreen.main.bounds.width * 0.8,
                   height: UIScreen.main.bounds.height * 0.5)
        }
        .opacity(isShowed ? 1 : 0)
    }
}

struct PopView_Previews: PreviewProvider {
    static var previews: some View {
        PopView(isShowed: .constant(true))
    }
}


struct popButton: View {
    
    var text: String
    var action: () -> ()
    
    var body: some View {
        Button {
            action()
        } label: {
            Text(text)
        }.buttonStyle(popButtonStyle())
    }
}

struct popButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        ZStack {
            Color.MetinBackground
                .cornerRadius(30)
            RoundedRectangle(cornerRadius: 30)
                .stroke(Color.MetinYellow)
                .frame(maxWidth: .infinity)
            configuration.label
                .foregroundColor(.MetinYellow)
                .bold()
                .font(.callout)
        }
        .frame(height: 56)

    }
}

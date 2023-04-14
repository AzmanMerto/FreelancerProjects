//
//  CustomPresentedSheetsView.swift
//  Metin2AddServerApp
//
//  Created by NomoteteS on 16.03.2023.
//

import SwiftUI

struct sheet1: View {
    var body: some View {
        CustomPresentedSheetsView(buttonText: "", data: Data())
    }
}

struct sheet2: View {
    var body: some View {
        CustomPresentedSheetsView(buttonText: "", data: Data())
    }
}

struct sheet3: View {
    var body: some View {
        CustomPresentedSheetsView(buttonText: "", data: Data())
    }
}

struct sheet4: View {
    var body: some View {
        CustomPresentedSheetsView(buttonText: "", data: Data())
    }
}

struct sheet5: View {
    var body: some View {
        CustomPresentedSheetsView(buttonText: "", data: Data())
    }
}

struct sheet6: View {
    var body: some View {
        CustomPresentedSheetsView(buttonText: "", data: Data())
    }
}


struct CustomPresentedSheetsView: View {
    
    @Environment(\.dismiss) var Dismiss
    var buttonText: String
    var data : Data
    
    var body: some View {
        ZStack {
            Color.MetinBackground
                .ignoresSafeArea()
            LazyVStack {
                Section {
                    ForEach(data, id: \.self) { server in
                        
                    }
                } header: {
                    RegularButton(buttonText: buttonText) {
                        Dismiss()
                    }
                }
            }
        }
    }
}

struct CustomPresentedSheetsView_Previews: PreviewProvider {
    static var previews: some View {
//        CustomPresentedSheetsView(buttonText: "asdasdasdsaasd",data: Data())
        
        DataRowView(image: Image("testImage"),
                    titleText: "Avedon2",
                    dateText: "10 Mart 2023")
    }
}

private struct DataRowView: View {
    
    var image: Image
    var titleText: String
    var dateText: String
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color.MetinYellow,
                        lineWidth: 2)
            Color.MetinBlack
                .padding(.all,1)
            HStack {
                image
                    .resizable()
                    .clipShape(Circle())
                    .frame(width: 54,
                           height: 54)
                VStack(alignment: .leading) {
                    Text("Sunucu ismi: \(titleText)")
                        .font(.system(.caption,weight: .medium))
                    Text("Açılış Tarihi: \(dateText)")
                        .font(.system(size: 8,weight: .light))
                }
                .foregroundColor(.MetinYellow)
                
                Spacer()
                
                Button {
                    if let url = URL(string: "https://chat.openai.com/chat") {
                        UIApplication.shared.open(url)
                    }
                } label: {
                    Text("Sunucuya Git")
                }
                .buttonStyle(DataRowViewButtonStyle())
            }
            .padding(.horizontal)
        }
        .cornerRadius(12)
        .frame(height: 70)
        .padding(.horizontal,30)
    }
}

private struct DataRowViewButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.system(size: 10,weight: .bold))
            .background{
                RoundedRectangle(cornerRadius: 15, style: .circular)
                    .foregroundColor(.MetinYellow)
                    .padding(.all,-5)
            }
    }
}

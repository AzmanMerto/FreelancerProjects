//
//  CustomPresentedSheetsView.swift
//  Metin2AddServerApp
//
//  Created by NomoteteS on 16.03.2023.
//

import SwiftUI


struct PresentedSheetsView: View {
    
    @Environment(\.dismiss) var dismiss
    var buttonText: String
    var posts: [Post]
    var action: () -> ()
    
    var body: some View {
        ZStack {
            Color.MetinBackground.ignoresSafeArea()
            VStack {
                RegularButton(buttonText: buttonText) {
                    dismiss()
                }
                .padding(EdgeInsets(top: 50, leading: 20, bottom: 30, trailing: 20))
                
                Rectangle()
                    .foregroundColor(.MetinYellow).opacity(0.5)
                    .frame(height: 0.5)
                    .padding(.horizontal)
                
                ScrollView(.vertical, showsIndicators: true) {
                    ForEach(posts, id: \.id) { server in
                        DataRowView(image: server.image,
                                    titleText: server.name,
                                    dateText: server.date,
                                    url: server.url)
                        .padding(.vertical)
                    }
                }
                
                Rectangle()
                    .foregroundColor(.MetinYellow).opacity(0.5)
                    .frame(height: 0.5)
                    .padding(.horizontal)
            }
        }
        .onAppear{
            action()
        }
    }
}

struct CustomPresentedSheetsView_Previews: PreviewProvider {
    static var previews: some View {
        DataRowView(image: "testImage",
                    titleText: "Avedon2",
                    dateText: "10 Mart 2023",
                    url: "")
    }
}

private struct DataRowView: View {
    var image: String
    var titleText: String
    var dateText: String
    var url: String
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color.MetinYellow,
                        lineWidth: 2)
            Color.MetinBlack
                .cornerRadius(12)
                .padding(.all,1)
            HStack {
                //MARK: DataRowView - Image
                if let url = URL(string: image) {
                    AsyncImage(url: url)
                        .clipShape(Circle())                        
                }
                //MARK: DataRowView - Title &  Date
                VStack(alignment: .leading) {
                    // title
                    if titleText == "" {
                        Text("İsmi Belli Değil")
                            .font(.system(.callout,weight: .medium))
                    }else {
                        Text(titleText)
                            .font(.system(.callout,weight: .medium))
                    }
                    // date
                    if dateText == "" {
                        Text("Açılış Tarihi: Yakında")
                            .font(.system(.caption2,weight: .light))
                    } else {
                        Text("Açılış Tarihi: \(dateText)")
                            .font(.system(.caption2,weight: .light))
                    }
                }
                .foregroundColor(.MetinYellow)
                Spacer()
                //MARK: DataRowView - URL
                Button {
                    if let url = URL(string: url) {
                        if self.url == "" {
                            UIApplication.shared.open(URL(string: "https://www.m2hanesi.com")!)
                        } else {
                            UIApplication.shared.open(url)
                        }
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

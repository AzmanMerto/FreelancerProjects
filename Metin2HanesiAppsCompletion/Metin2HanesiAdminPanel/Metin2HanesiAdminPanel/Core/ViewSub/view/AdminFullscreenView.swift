//
//  AdminFullscreenView.swift
//  Metin2HanesiAdminPanel
//
//  Created by NomoteteS on 13.04.2023.
//

import SwiftUI

struct AdminFullscreenView: View {
    
    @Environment(\.dismiss) var dismiss
    @State var isOpenedSheet = false
    
    @Binding var isPressed: Bool
    @State var viewName: String
    @Binding var ImageURL: UIImage?
    @Binding var name: String
    @Binding var date: String
    @Binding var url: String
    @State var action: () -> ()
    
    var body: some View {
        ZStack {
            Color.MetinBlack
                .ignoresSafeArea()
            ScrollView(.vertical, showsIndicators: false) {
                NewViewButton(buttonName: viewName) {}
                    .disabled(true)
                    .multilineTextAlignment(.center)
                    .padding(.all)
                VStack {
                    //MARK: AdminFullScreenView - TextFields
                    AddDataTextfield(text: "Sunucu İsmi",
                                     textData: $name)
                    .padding(.vertical)
                    AddDataTextfield(text: "Sunucu Açılış Tarihi",
                                     textData: $date)
                    .padding(.vertical)
                    AddDataTextfield(text: "Sunucu Linki",
                                     textData: $url)
                    .padding(.vertical)
                    //MARK: AdminFullScreenView - Image
                    Circle()
                        .stroke(Color.MetinYellow)
                        .scaledToFit()
                        .overlay {
                            if let image = ImageURL {
                                Image(uiImage: image)
                                    .resizable()
                                    .scaledToFill()
                                    .clipShape(Circle())
                            }else {
                                Image("Logo")
                                    .resizable()
                                    .scaledToFit()
                            }
                        }
                        .onTapGesture {
                            isOpenedSheet.toggle()
                        }
                        .padding(.all)
                        .padding(.vertical)
                }
                .onAppear{
                    isPressed = false
                }
                .sheet(isPresented: $isOpenedSheet) {
                    ImagePicker(selectedImage: $ImageURL)
                }
                
                NewViewButton(buttonName: "Gönder") {
                    DispatchQueue.main.asyncAfter(deadline: .now()){
                        dismiss()
                        action()
                        self.isPressed.toggle()
                    }
                }
                
            }
            .padding(.horizontal)
            .padding(.top)
        }
    }
}

struct AdminFullscreenView_Previews: PreviewProvider {
    static var previews: some View {
        AdminFullscreenView(isPressed: .constant(false),
                            viewName: "",
                            ImageURL: .constant(UIImage()),
                            name: .constant(""),
                            date: .constant(""),
                            url: .constant("")) { }
    }
}

//
//  ProductDetail.swift
//  Shigo
//
//  Created by Mert Türedü on 4.06.2023.
//

import SwiftUI

struct ProductDetail: View {
    
    @Environment(\.dismiss) var dismiss
    @ObservedObject var viewModel: ProductDetailModel
    
    
    var body: some View {
        VStack(spacing: 10) {
            ZStack {
                Text(viewModel.products.productName)
                    .font(.largeTitle)
                HStack {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "arrowshape.backward")
                    }
                    .foregroundColor(.black)
                    Spacer()
                }
                .padding(.horizontal)
            }
            productList
            Rectangle()
                .foregroundColor(.red)
                .frame(height: 40)
                .overlay {
                    Text("Kargo Takip Numarasi (1.10€)")
                        .foregroundColor(.white)
                }
            HStack(spacing: 40) {
                Button {
                    viewModel.followNumber = true
                } label: {
                    Text("Evet")
                }
                .buttonStyle(.bordered)
                
                Button {
                    viewModel.followNumber = false
                } label: {
                    Text("Hayır")
                }
                .buttonStyle(.bordered)
            }
            .foregroundColor(.black)
            Text("Lütfen \(viewModel.errorMassage) alanı doldurunuz.")
                .opacity(viewModel.errorMassage.isEmpty ? 0 : 1)

            buttonOrder

            Spacer()
        }
        .onChange(of: [viewModel.code, viewModel.itemCount, viewModel.color, viewModel.orderUserNameAndSurname, viewModel.address, viewModel.phoneOrEmail]) { _ in
            viewModel.errorMassage = ""
        }
    }
}

struct ProductDetail_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetail(viewModel: .init(products: Products(productName: "Title", productPrice: 10.00)))
    }
}

extension ProductDetail {
    var productList: some View {
        ScrollView {
            VStack(alignment: .leading) {
                ProductTextPlace(textfieldName: "Kod", textfieldInside: $viewModel.code)
                    .frame(width: UIScreen.main.bounds.width * 0.3)
                ProductTextPlace(textfieldName: "Adet", textfieldInside: $viewModel.itemCount)
                    .frame(width: UIScreen.main.bounds.width * 0.3)
                ProductTextPlace(textfieldName: "Renk", textfieldInside: $viewModel.color)
                    .frame(width: UIScreen.main.bounds.width * 0.3)
                Rectangle()
                    .frame(height: 1)
                    .padding(.all)
                
                ProductTextPlace(textfieldName: "Alici Adı ve Soyadı", textfieldInside: $viewModel.orderUserNameAndSurname)
                
                VStack (alignment: .leading){
                    Text("Adres")
                        .bold()
                        .padding(.bottom)
                    TextField("", text: $viewModel.address)
                        .padding(.leading,5)
                        .background(Color.gray.ignoresSafeArea().opacity(0.4).frame(height: 60))
                    
                }
                .frame(height: 80)
                .padding(.horizontal)
                
                
                ProductTextPlace(textfieldName: "Telefon Numarası veya E-mail", textfieldInside: $viewModel.phoneOrEmail)
                
                
            }
        }
    }
    
    var buttonOrder: some View {
        Button {
            guard !viewModel.code.isEmpty else { viewModel.errorMassage = "Kod" ;return }
            guard !viewModel.itemCount.isEmpty else { viewModel.errorMassage = "Adet" ;return }
            guard !viewModel.color.isEmpty else { viewModel.errorMassage = "Renk" ;return }
            guard !viewModel.orderUserNameAndSurname.isEmpty else { viewModel.errorMassage = "Alici Adı ve Soyadı" ;return }
            guard !viewModel.address.isEmpty else { viewModel.errorMassage = "Adres" ;return }
            guard !viewModel.phoneOrEmail.isEmpty else { viewModel.errorMassage = "Telefon Numarası" ;return }
            viewModel.uploadOrder()
            
        } label: {
            VStack {
                Rectangle()
                    .foregroundColor(.black)
                    .frame(height: 40)
                    .overlay {
                        Text("Toplam Tutar")
                            .foregroundColor(.white)
                            .font(.title)
                            .bold()
                    }
                Text(viewModel.followNumber ? String(format: "%.2f EUR", viewModel.products.productPrice + 1.10) : String(format: "%.2f EUR", viewModel.products.productPrice))
                    .font(.largeTitle)
                    .bold()
            }
        }
        .foregroundColor(.black)
    }
}


struct ProductTextPlace: View {
    
    var textfieldName: String
    @Binding var textfieldInside: String
    
    var body: some View {
        VStack (alignment: .leading){
            Text(textfieldName)
                .bold()
            TextField("", text: $textfieldInside)
                .padding(.leading,5)
                .background(Color.gray.ignoresSafeArea().opacity(0.4).frame(height: 40))
            
        }
        .frame(height: 60)
        .padding(.horizontal)
        .padding(.vertical,5)
    }
}

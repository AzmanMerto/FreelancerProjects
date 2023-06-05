//
//  OrderView.swift
//  Shigo
//
//  Created by NomoteteS on 10.03.2023.
//

import SwiftUI

struct OrderView: View {
    @ObservedObject var viewModel = OrderViewModel()
    
    var body: some View {
        ZStack {
            
            VStack {
                ScrollView(.vertical, showsIndicators: false) {
                   itemsOrder
                }
            }
            .fullScreenCover(item: $viewModel.selectedProduct) { selected in
                ProductDetail(viewModel: .init(products: selected))
            }
        }
    }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView()
    }
}

extension OrderView {
    var itemsOrder: some View {
        LazyVGrid(columns: [GridItem(), GridItem()], alignment: .center, spacing: 15) {
            ForEach(viewModel.productItems) { item in
                Button {
                    viewModel.selectedProduct = item
                } label: {
                    VStack {
                        Text(item.productName)
                        Image("DifferentColor")
                            .rotationEffect(.degrees(180))
                        HStack {
                            Text(String(format: "%.1f EUR", item.productPrice))
                                .font(.caption2)
                            Spacer()
                        }
                    }
                    .fixedSize()
                }
                .foregroundColor(.black)
            }
        }
    }
}

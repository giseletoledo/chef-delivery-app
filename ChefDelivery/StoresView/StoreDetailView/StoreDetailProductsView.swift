//
//  StoreDetailProductsView.swift
//  ChefDelivery
//
//  Created by GISELE TOLEDO on 28/07/23.
//

import SwiftUI

struct StoreDetailProductsView: View {
    @Binding var cartProducts: [ProductType]
    var products: Binding<[ProductType]>
    @State private var selectedProduct: ProductType?
      
      var body: some View {
          VStack(alignment: .leading) {
              Text("Produtos")
                  .font(.title2)
                  .bold()
                  .padding()
              
              ForEach(products.wrappedValue) { product in
                  Button {
                      selectedProduct = product
                  } label: {
                      StoreDetailProductItemView(product: product)
                  }
                  .sheet(item: $selectedProduct) { product in
                      let binding = Binding(
                          get: { products.wrappedValue.first { $0.id == product.id }?.quantityInCart ?? 0 },
                          set: { newValue in
                              if let index = products.wrappedValue.firstIndex(where: { $0.id == product.id }) {
                                  products.wrappedValue[index].quantityInCart = newValue
                              }
                          }
                      )
                      ProductDetailView(
                                             product: product,
                                             productQuantityInCart: binding,
                                             cartProducts: $cartProducts
                                         )
                  }
              }
          }
      }
  }

struct StoreDetailProductsView_Previews: PreviewProvider {
    static var previews: some View {
            let productsBinding = Binding.constant(storesMock[0].products)
            let cartProductsBinding = Binding.constant([ProductType]()) // Criando um array vazio para simular produtos no carrinho
            
            return StoreDetailProductsView(cartProducts: cartProductsBinding, products: productsBinding)
        }
}

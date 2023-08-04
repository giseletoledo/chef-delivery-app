//
//  ProductDetailView.swift
//  ChefDelivery
//
//  Created by GISELE TOLEDO on 26/07/23.
//

import SwiftUI

struct ProductDetailView: View {
    
    let product: ProductType
    @State private var productQuantity = 1
    @Binding var productQuantityInCart: Int
    @Binding var cartProducts: [ProductType]
    
    var body: some View {
        VStack {
            
            ProductDetailHeaderView(product: product)
            
            Spacer()
            
           ProductDetailQuantityView(productQuantity: $productQuantity)
            
            Spacer()
            
            
            ProductDetailButtonView(cartProducts: $cartProducts, productQuantityInCart: $productQuantityInCart,product: product, productQuantity: $productQuantity)
        }
    }
}

struct ProductDetailView_Previews: PreviewProvider {
    @State static var quantityInCart = 1
    @State static var cartProducts: [ProductType] = []
    

       static var previews: some View {
           ProductDetailView(
               product: storesMock[0].products[0],
               productQuantityInCart: $quantityInCart,
               cartProducts: $cartProducts
           )
       }
}

struct ProductDetailButtonView: View {
    @State private var isCartSheetPresented = false
    @Binding var cartProducts: [ProductType]
    var productQuantityInCart: Binding<Int>
    var product: ProductType
    @Binding var productQuantity: Int
    
    var body: some View {
        Button {
                        if productQuantity > 0 {
                            var updatedProduct = product  // Fazemos uma cópia do produto
                                           updatedProduct.quantityInCart = productQuantity  // Atribuímos a quantidade correta
                                           cartProducts.append(updatedProduct)  // Adicionamos o produto atualizado
                            isCartSheetPresented = true
                        }
                    print("Quantity In Cart: \(productQuantityInCart.wrappedValue)")
                    print("Cart Products: \(cartProducts)")
                    print("O botão foi pressionado")
                }
    
    label: {
            HStack{
                Image(systemName: "cart")
                Text("Adicionar ao carrinho")
            }
            .padding(.horizontal, 32)
            .padding(.vertical, 16)
            .font(.title3)
            .bold()
            .background(Color("ColorRed"))
            .foregroundColor(.white)
            .cornerRadius(32)
            .shadow(color: Color("ColorRed").opacity(0.5), radius: 10, x: 6, y: 8)
        }
    .sheet(isPresented: $isCartSheetPresented){
        CartView(cartProducts: $cartProducts, productQuantity: $productQuantity)
    }
           }
}

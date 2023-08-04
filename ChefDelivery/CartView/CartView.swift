//
//  CartView.swift
//  ChefDelivery
//
//  Created by GISELE TOLEDO on 03/08/23.
//

import SwiftUI

struct CartView: View {
  
    @Binding var cartProducts: [ProductType]
    @Binding var productQuantity: Int
        
    var totalPrice: Double {
          return cartProducts.reduce(0) { $0 + ($1.price * Double($1.quantityInCart)) }
      }
        
        var body: some View {
            VStack {
                Text("Carrinho")
                    .font(.title2)
                    .bold()
                    .padding()
                
                List {
                                ForEach(cartProducts.indices, id: \.self) { index in
                                    HStack {
                                        Text(cartProducts[index].name)
                                        Spacer()
                                        Text("\(cartProducts[index].quantityInCart) x \(cartProducts[index].formattedPrice)")
                                    }
                                }
                            }
                
                Spacer()
                
                Text("Total: \(totalPrice.formatPrice())")
                    .font(.headline)
                    .padding()
            }
            .onAppear {
                        print("Cart Products:")
                        for product in cartProducts {
                            print("\(product.name): \(product.quantityInCart)")
                        }
                print("Cart Products: \(cartProducts)")
                           print("Total Price: \(totalPrice)")
                    }
            
        }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
            let sampleCartProducts: [ProductType] = [
                ProductType(id: 1, name: "Sample Product 1", description: "Sample Description 1", image: "sampleImage1", price: 10.0, quantityInCart: 2),
                ProductType(id: 2, name: "Sample Product 2", description: "Sample Description 2", image: "sampleImage2", price: 20.0, quantityInCart: 1)
            ]
            
        return CartView(cartProducts: .constant(sampleCartProducts), productQuantity: .constant(1))
        }
}

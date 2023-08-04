//
//  StoreDetailView.swift
//  ChefDelivery
//
//  Created by GISELE TOLEDO on 25/07/23.
//

import SwiftUI

struct StoreDetailView: View {
    
    @State var mutableStore: StoreType
    @State var cartProducts: [ProductType]
    @Environment(\.presentationMode) var presentationMode
    
    
    var body: some View {

        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading){
                
                StoreDetailHeaderView(store: mutableStore)
                               
                StoreDetailProductsView(cartProducts: $mutableStore.cartProducts, products: $mutableStore.products)

                    
                }
            }
            .navigationTitle(mutableStore.name)
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden()
        .toolbar{
            ToolbarItem(placement: .navigationBarLeading){
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    HStack(spacing: 4) {
                        Image(systemName: "cart")
                        
                        Text("Lojas")
                    }
                    .foregroundColor(Color("ColorRed"))
                }

            }
        }
        }
    }

struct StoreDetailView_Previews: PreviewProvider {
    static var previews: some View {
           let sampleStore = storesMock[0]
           
           // Simule produtos no carrinho
           let sampleCartProducts: [ProductType] = [
               ProductType(id: 1, name: "Product 1", description: "Description", image: "image1", price: 10.0, quantityInCart: 2),
               ProductType(id: 2, name: "Product 2", description: "Description", image: "image2", price: 15.0, quantityInCart: 1)
           ]
           
           return StoreDetailView(mutableStore: sampleStore, cartProducts: sampleCartProducts)
       }
}

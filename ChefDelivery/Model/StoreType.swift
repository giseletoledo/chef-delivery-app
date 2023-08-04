//
//  StoreType.swift
//  ChefDelivery
//
//  Created by GISELE TOLEDO on 25/07/23.
//

import Foundation

struct StoreType: Identifiable {
    let id: Int
    let name: String
    let logoImage: String
    let headerImage: String
    let location: String
    let stars: Int
    var products: [ProductType]
    var cartProducts: [ProductType] = [] 
}

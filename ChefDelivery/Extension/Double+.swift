//
//  Double+.swift
//  ChefDelivery
//
//  Created by GISELE TOLEDO on 26/07/23.
//

import Foundation

extension Double {
    func formatPrice() -> String {
        let formattedString = String(format: "%.2f", self)
        return formattedString.replacingOccurrences(of: ".", with: ",")
    }
}

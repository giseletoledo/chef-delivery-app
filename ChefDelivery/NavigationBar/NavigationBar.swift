//
//  NavigationBar.swift
//  ChefDelivery
//
//  Created by GISELE TOLEDO on 10/07/23.
//

import SwiftUI

struct NavigationBar: View {
    var body: some View {
        HStack {
            Button("Rua Vergueiro, 3185"){
                
            }
            .font(.subheadline)
            .fontWeight(.semibold)
            .foregroundColor(.black)
            
            Spacer()
            
            Button(action:{}){
                Image(systemName: "bell.badge")
                    .font(.title3)
                    .foregroundColor(.red)
            }
         }
    }
}

struct NavigationBar_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBar()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}

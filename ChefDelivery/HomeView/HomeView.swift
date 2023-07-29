//
//  HomeView.swift
//  ChefDelivery
//
//  Created by GISELE TOLEDO on 29/07/23.
//

import SwiftUI

struct HomeView: View {
    
    @State private var isAnimating = false
    @State private var imageOffset: CGSize = .zero
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                
                Circle()
                    .foregroundColor(Color("ColorRed"))
                    .frame(width: isAnimating ? 200 : 0)
                    .position(x: isAnimating ? 50 : -50, y: isAnimating ? 100 : -100)
                    .blur(radius: 60)
                    .opacity(isAnimating ? 0.5 : 0)
                
                Circle()
                    .foregroundColor(Color("ColorRedDark"))
                    .frame(width: isAnimating ? 200 : 0)
                    .position(x: geometry.size.width - 50, y: isAnimating ? geometry.size.height + 50 : geometry.size.height + 50)
                    .blur(radius: 60)
                    .opacity(isAnimating ? 0.5 : 0)
                
                VStack {
                    Text("Chef Delivery")
                        .font(.system(size:40))
                        .fontWeight(.heavy)
                    .foregroundColor(Color("ColorRed"))
                    .opacity(isAnimating ? 1 : -40)
                    
                    Text("Peça as suas comidas no conforto da sua casa")
                        .font(.title2)
                        .padding()
                        .multilineTextAlignment(.center)
                        .foregroundColor(.black.opacity(0.7))
                        .font(.system(size:40))
                        .fontWeight(.heavy)
                        .opacity(isAnimating ? 1 : 0)
                        .offset(y: isAnimating ? 0 : -40 )
                    
                   Image("image")
                        .resizable()
                        .scaledToFit()
                        .shadow(radius: 40)
                        .padding(isAnimating ? 32 : 92)
                        .opacity(isAnimating ? 1 : 0)
                        .offset(x: imageOffset.width, y: imageOffset.height)
                        .gesture(DragGesture()
                            .onChanged({ gesture in
                                withAnimation(.easeOut(duration: 0.5)){
                                    imageOffset = gesture.translation
                                }
                                
                                //print(gesture.translation)
                            })
                                .onEnded({ _ in
                                    withAnimation(.easeOut(duration: 0.5)){
                                        imageOffset = .zero
                                    }
                                })
                        )
                }
                .onAppear {
                    withAnimation(.easeOut(duration: 3)){
                        isAnimating = true
                    }
            }
            }
        }
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

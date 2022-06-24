//
//  HomeView.swift
//  CarouselParallaxEffect
//
//  Created by Валерий Игнатьев on 24.06.22.
//

import SwiftUI

//MARK: - HomeView

struct HomeView: View {
    
    //MARK: Properties
    
    @State private var currentIndex: Int = 2
    
    @GestureState private var dragOffset: CGFloat = 0
    
    private let defaultOffset: CGFloat = 60
    
    //MARK: Body
    
    var body: some View {
        GeometryReader { grProxy in
            let sizeCard: CGFloat = grProxy.size.width - defaultOffset
            
            HStack(spacing: 0) {
                ForEach(0..<10) { number in
                    RoundedRectangle(cornerRadius: 13, style: .continuous)
                        .fill(.blue)
                        .padding()
                        .overlay(Text(number.description))
                        .offset(x: cardCentering(sizeCard))
                        .offset(x: defaultOffset / 2)
                        .frame(width: sizeCard)
                }
            }
        }
        .frame(height: 300)
    }
    
    //MARK: Private Methods

    private func cardCentering(_ sizeCard: CGFloat) -> CGFloat {
        -CGFloat(currentIndex) * sizeCard
    }
}

//MARK: - PreviewProvider

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

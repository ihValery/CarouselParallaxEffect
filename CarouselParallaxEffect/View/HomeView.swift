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
                    GeometryReader { grProxyCard in
                        let minX: CGFloat = grProxyCard.frame(in: .global).minX
//                        let distance: CGFloat = abs(sizeCard / 2 - midX)
//                        let damping: CGFloat = 4.5
//                        let percentage: CGFloat = abs(distance / (sizeCard / 2) / damping - 1)
                        
                        RoundedRectangle(cornerRadius: 13, style: .continuous)
                            .fill(.blue)
                            .padding()
                            .overlay(
                                VStack {
                                    Text(minX.description)
//                                    Text( Int(dragOffset).description )
                                }
                            )
                            .offset(x: cardCentering(sizeCard))
                            .offset(x: defaultOffset / 2)
                            .offset(x: dragOffset)
                            .gesture(simpleDrag(sizeCard))
//                            .scaleEffect(currentIndex == number ? 1.2 : 1)
//                            .scaleEffect(max(1, abs(dragOffset / 10)))
                    }
                    .frame(width: sizeCard)
                }
            }
        }
        .frame(height: 300)
        .animation(.interpolatingSpring(mass: 0.6, stiffness: 100, damping: 10, initialVelocity: 0.3), value: dragOffset)
    }
    
    //MARK: Private Methods
    
    private func cardCentering(_ sizeCard: CGFloat) -> CGFloat {
        -CGFloat(currentIndex) * sizeCard
    }
    
    private func simpleDrag(_ sizeCard: CGFloat) -> some Gesture {
        DragGesture(minimumDistance: 0)
            .updating($dragOffset) { value, state, transaction in
                state = value.translation.width
            }
            .onEnded { value in
                let threshold = sizeCard * 0.5
                var newIndex = Int(-value.translation.width / threshold) + currentIndex
                newIndex = min(max(newIndex, 0), 10 - 1)
                
                currentIndex = newIndex
            }
    }
}

//MARK: - PreviewProvider

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

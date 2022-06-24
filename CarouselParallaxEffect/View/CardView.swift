//
//  CardView.swift
//  CarouselParallaxEffect
//
//  Created by Валерий Игнатьев on 24.06.22.
//

import SwiftUI

//MARK: - CardView

struct CardView: View {
    
    //MARK: Properties
    
    private let goldenRatio: CGFloat = 1.61803
    
    //MARK: Body
    
    var body: some View {
        GeometryReader { grProxy in
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .fill(.blue)
                .frame(width: grProxy.size.height * goldenRatio)
        }
    }
}

//MARK: - PreviewProvider

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView()
            .frame(height: 200)
            .padding()
    }
}

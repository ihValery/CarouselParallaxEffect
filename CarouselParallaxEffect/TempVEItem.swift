//
//  TempVEItem.swift
//  CarouselParallaxEffect
//
//  Created by Валерий Игнатьев on 25.06.22.
//

import SwiftUI

//MARK: - TempVEItem

struct TempVEItem: View {
    
    //MARK: Properties
    
    let item: TempVEModel
    let screenSize: CGSize
    let width: CGFloat
    
    //MARK: Body
    
    var body: some View {
        GeometryReader { grProxy in
            
            let midX = grProxy.frame(in: .global).midX
            let distance = abs(screenSize.width / 2 - midX)
            let damping: CGFloat = 4.5
            let percentage = abs(distance  / (screenSize.width / 2) / damping - 1)
            
            VStack {
                RoundedRectangle(cornerRadius: 20, style: .continuous)
                    .foregroundColor(item.color)
                    .frame(width: width)
                    .frame(height: (screenSize.height * 2) / 3)
                    .shadow(color: item.color.opacity(0.6), radius: 14, y: 10)
                    .overlay(
                        VStack {
                            Text("\(Int( midX ))")
                            Text("\(Int( distance ))")
                            Text("\(percentage)")
                        }
                    )
                
                Text(item.nameEn)
                    .font(.largeTitle.bold())
                    .foregroundColor(.white)
                    .shadow(color: item.color, radius: 1, y: 4)
            }
            .frame(maxHeight: .infinity)
            .scaleEffect(percentage)
        }
        .frame(width: width)
        .frame(maxHeight: .infinity)
        .background(.red)
    }
}

//MARK: - PreviewProvider

struct TempVEItem_Previews: PreviewProvider {
    static var previews: some View {
        TempVideoExample()
    }
}

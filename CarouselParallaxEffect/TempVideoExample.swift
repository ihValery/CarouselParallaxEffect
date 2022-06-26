//
//  TempVideoExample.swift
//  CarouselParallaxEffect
//
//  Created by Валерий Игнатьев on 25.06.22.
//

import SwiftUI

//MARK: - TempVideoExample

struct TempVideoExample: View {
    
    //MARK: Properties
    
    private let models = TempVEModel.sampleModels

    //MARK: Body

    var body: some View {
        GeometryReader { grProxy in
//            let screenSize = grProxy.size
            
            ZStack {
                moviesCarousel(grProxy: grProxy)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
    
    //MARK: Private Methods

    private func moviesCarousel(grProxy: GeometryProxy) ->  some View {
        let screenSize = grProxy.size
        let itemWidth = screenSize.width * 0.8
        
        //centering ScrollView Content
        let paddingX = (screenSize.width - itemWidth) / 2
        
        return ScrollView(.horizontal) {
            HStack(spacing: 10) {
                ForEach(models) { item in
                    TempVEItem(item: item, screenSize: screenSize, width: itemWidth)
                }
            }
            .padding(.horizontal, paddingX)
        }
    }
}

//MARK: - PreviewProvider

struct TempVideoExample_Previews: PreviewProvider {
    static var previews: some View {
        TempVideoExample()
    }
}

//MARK: - TempVEModel

struct TempVEModel: Identifiable {
    
    //MARK: Properties
    
    let id: UUID
    let color: Color
    let nameRu: String
    let nameEn: String
    
    //MARK: Initializer
    
    init(_ color: Color,_ nameRu: String,_ nameEn: String) {
        id = UUID()
        self.color = color
        self.nameRu = nameRu
        self.nameEn = nameEn
    }
    
    static let sampleModels = [
        TempVEModel(.cascade, "Каскад", "Cascade"),
        TempVEModel(.coralRose, "Коралловый розовый", "Coral Rose"),
        TempVEModel(.superSonic, "Супер соник", "Super Sonic"),
        TempVEModel(.popcorn, "Попкорн", "Popcorn"),
        TempVEModel(.potpourri, "Попурри", "Potpourri"),
        TempVEModel(.bubblegum, "Жевательная резинка", "Bubblegum"),
        TempVEModel(.fragileSprout, "Хрупкий росток", "FragileSprout"),
        TempVEModel(.sudanBrown, "Судан браун", "Sudan Brown"),
        TempVEModel(.orchidBloom, "Цветение орхидеи", "Orchid Bloom"),
        TempVEModel(.coffeeQuartz, "Кофейный кварц", "Coffee Quartz")
    ]
}

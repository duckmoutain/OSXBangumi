//
//  FavoriteButton.swift
//  wingman
//
//  Created by yangjiaqi08 on 2021/12/2.
//

import SwiftUI

struct FavoriteButton: View {
    @Binding var landmark: Landmark
    
    var body: some View {
        Button {
            landmark.isFavorite.toggle()
            overrideData(data: ModelData().landmarks)
        } label: {
            Label("Toggle Favorite", systemImage: landmark.isFavorite ? "star.fill" : "star")
                .labelStyle(.iconOnly)
                .foregroundColor(landmark.isFavorite ? .yellow : .gray)
        }
    }
}

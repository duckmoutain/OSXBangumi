//
//  FavoriteButton.swift
//  wingman
//
//  Created by yangjiaqi08 on 2021/12/2.
//

import SwiftUI

struct FavoriteButton: View {
    @EnvironmentObject var modelData: ModelData
    var index: Int
    
    var body: some View {
        Button {
            modelData.mylandmarks[index].is_favorite.toggle()
            overrideData(data: modelData.mylandmarks)
        } label: {
            Label("Toggle Favorite", systemImage: modelData.mylandmarks[index].is_favorite ? "star.fill" : "star")
                .labelStyle(.iconOnly)
                .foregroundColor(modelData.mylandmarks[index].is_favorite ? .yellow : .gray)
        }
    }
}

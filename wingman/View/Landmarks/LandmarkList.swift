//
//  LandmarkList.swift
//  wingman
//
//  Created by yangjiaqi08 on 2021/12/2.
//

import SwiftUI

struct LandmarkList: View {
    @EnvironmentObject var modelData: ModelData
    @State private var showFavoritesOnly = false
    
    var filteredLandmarks: [myLandmark] {
        modelData.mylandmarks.filter { landmark in
            (!showFavoritesOnly || landmark.is_favorite)
        }
    }
    
    var body: some View {
        List {
            Section("Apple Sample") {
                Toggle(isOn: $showFavoritesOnly) {
                    Text("Favorites only")
                }
                
                ForEach(filteredLandmarks) { landmark in
                    NavigationLink{
                        LandmarkDetail(landmark: landmark)
                    } label: {
                        LandmarkRow(landmark:  landmark)
                    }
                }
                .navigationTitle("Landmarks")
            }
        }
    }
}

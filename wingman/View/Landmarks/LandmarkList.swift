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
        NavigationView {
            List{
                Link("登陆Bangumi", destination:  BangumiAccountRequestParams.shared.getAuthorizeCodeUrl()!)
                InfoBtn()
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

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkList()
    }
}

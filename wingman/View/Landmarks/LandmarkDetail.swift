//
//  LandmarkDetail.swift
//  wingman
//
//  Created by yangjiaqi08 on 2021/12/2.
//

import SwiftUI

struct LandmarkDetail: View {
    @EnvironmentObject var modelData: ModelData
    var landmark: myLandmark
    
    var landmarkIndex: Int {
        modelData.mylandmarks.firstIndex(where: {$0.id == landmark.id})!
    }
    
    var body: some View {
        ScrollView{
            MapView(coordinate:  landmark.loactionCoordinate)
                .frame(height: 300)
            
            Profile(image: landmark.image)
                .offset(y: -130)
                .padding(.bottom, -130)
            
            VStack(alignment: .leading) {
                HStack{
                    Text(landmark.name)
                        .font(.title)
                    FavoriteButton(index: landmarkIndex)
                }
                HStack{
                    Text(landmark.park)
                        .font(.subheadline)
                    Spacer()
                    Text(landmark.state)
                }
                .font(.subheadline)
                .foregroundColor(.secondary)
            }
            .padding()
            
            Divider()
            
            Text("About \(landmark.name)")
                .font(.title2)
            Text(landmark.description)
        }
        .navigationTitle(landmark.name)
    }
}

struct LandmarkDetail_Previews: PreviewProvider {
    static let modelData = ModelData()
    
    static var previews: some View {
        LandmarkDetail(landmark: modelData.mylandmarks[0])
            .environmentObject(modelData)
    }
}

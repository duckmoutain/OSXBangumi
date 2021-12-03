//
//  LandmarkRow.swift
//  wingman
//
//  Created by yangjiaqi08 on 2021/12/1.
//

import SwiftUI

struct LandmarkRow: View {
    
    var landmark: myLandmark
    
    var body: some View {
        HStack{
            landmark.image
                .resizable()
                .frame(width: 50, height: 50)
            Text(landmark.name)
            
            Spacer()
            
            if(landmark.is_favorite) {
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
            }
        }
        .frame(minWidth: 150)
    }
}

struct LandmarkRow_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkRow(landmark: ModelData().mylandmarks[0])
    }
}

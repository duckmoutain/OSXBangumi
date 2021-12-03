//
//  myLandmark.swift
//  wingman
//
//  Created by yangjiaqi08 on 2021/12/3.
//

import Foundation
import CoreLocation
import SwiftUI

struct myLandmark: Hashable, Codable, Identifiable {
    var name: String
    var id: Int
    var is_favorite: Bool
    var park: String
    var description: String
    private var image_name: String
    private var coordinates: Coordinates
    
    var image: Image {
        Image(image_name)
    }
    
    var loactionCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude
        )
    }

    
    struct Coordinates: Hashable, Codable {
        var latitude: Double
        var longitude: Double
    }
}

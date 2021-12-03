//
//  ModelData.swift
//  wingman
//
//  Created by yangjiaqi08 on 2021/12/1.
//

import Foundation
import Combine

final class ModelData: ObservableObject {
    @Published var mylandmarks: [myLandmark] = loadSandBox("landmarkData.json")
}

func loadSandBox<T: Decodable>(_ filename: String) -> T {
    let sandboxData: Data
    
    
    
    let sandBoxfile = sandBoxFileManager.shared.getFileUrlToRead(fileName: filename)
    
    do {
        sandboxData = try Data(contentsOf: sandBoxfile!)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle: \n\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: sandboxData)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self): \n\(error)")
    }
}

func overrideData(data: [myLandmark]) {
    let encoder = JSONEncoder()
    encoder.keyEncodingStrategy = .convertToSnakeCase
    encoder.outputFormatting = .prettyPrinted
    
    let jsonData = try! encoder.encode(data)
    do  {
        let url = sandBoxFileManager.shared.getFileUrlToWhite(fileName: "landmarkData.json")
        print(url!)
        try jsonData.write(to: url!)
    } catch {
        print(error)
    }
}

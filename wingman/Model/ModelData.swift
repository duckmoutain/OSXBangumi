//
//  ModelData.swift
//  wingman
//
//  Created by yangjiaqi08 on 2021/12/1.
//

import Foundation
import Combine

final class ModelData: ObservableObject {
   @Published var landmarks: [Landmark] = load("../Resources/landmarkData.json")
    @Published var mylandmarks: [myLandmark] = loadSandBox("landmarkData.json")
}

func loadSandBox<T: Decodable>(_ filename: String) -> T {
    let sandboxData: Data
    
    guard let sandBoxfile = sandBoxFileManager.shared.getFileUrl(fileName: filename)
    else {
        fatalError("Couldn't find \(filename)")
    }
    
    do {
        sandboxData = try Data(contentsOf: sandBoxfile)
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

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }
    
    do {
        data = try Data(contentsOf:  file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle: \n\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self): \n\(error)")
    }
}

func overrideData(data: [Landmark]) {
    let encoder = JSONEncoder()
    encoder.keyEncodingStrategy = .convertToSnakeCase
    encoder.outputFormatting = .prettyPrinted
    
    let jsonData = try! encoder.encode(data)
    do  {
        let url = sandBoxFileManager.shared.getFileUrl(fileName: "landmarkData.json")
        print(url!)
        try jsonData.write(to: url!)
    } catch {
        print(error)
    }
}

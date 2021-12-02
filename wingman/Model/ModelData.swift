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
    print(data)
    let os = OutputStream(toFileAtPath: "../Resources/landmarkData-.json", append: false)
    os?.open()
    JSONSerialization.writeJSONObject(data, to: os!, options: JSONSerialization.WritingOptions.prettyPrinted, error: NSErrorPointer.none)
    os?.close()
}


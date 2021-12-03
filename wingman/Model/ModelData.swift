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
    let encoder = JSONEncoder()
    encoder.keyEncodingStrategy = .convertToSnakeCase
    encoder.outputFormatting = .prettyPrinted
    
    
    let userAccountPath =  NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true).first!
    
    let jsonData = try! encoder.encode(data)
    do  {
        let url = URL.init(fileURLWithPath: userAccountPath).appendingPathComponent("landmarkData.json")
        print(url)
        try jsonData.write(to: url)
    } catch {
        print(error)
    }
}

func saveToJsonFile(fileName:String,dict:[Landmark]) {
        guard let documentDirectoryUrl = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return }
        let fileUrl = documentDirectoryUrl.appendingPathComponent("\(fileName).json")

        let personArray = dict

        // Transform array into data and save it into file
        do {
            let data = try JSONSerialization.data(withJSONObject: personArray, options: [])
            try data.write(to: fileUrl, options: [])
        } catch {
            print(error)
        }
    }


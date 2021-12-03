//
//  fileManager.swift
//  wingman
//
//  Created by yangjiaqi08 on 2021/12/3.
//

import Foundation

class sandBoxFileManager  {
    
    static let shared = sandBoxFileManager()
    
    private let baseUrl = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true).first!
    
    // Make sure the class has only one instance
    // Should not init outside
    private init() {}
    
    func getFileUrlToRead (fileName: String) -> URL? {
        let url = URL.init(fileURLWithPath: baseUrl).appendingPathComponent(fileName)
        let filePath = url.path
        let fileManager = FileManager.default
        if fileManager.fileExists(atPath: filePath) {
            return url
        }
        
        print("FILE NOT AVAILABLE")
        return Bundle.main.url(forResource: fileName, withExtension: nil)
    }
    
    func getFileUrlToWhite (fileName: String) -> URL? {
        let url = URL.init(fileURLWithPath: baseUrl).appendingPathComponent(fileName)
        return url
    }
    
    
}

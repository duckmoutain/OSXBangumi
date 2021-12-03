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
    
    func getFileUrl (fileName: String) -> URL? {
        let url = URL.init(fileURLWithPath: baseUrl).appendingPathComponent(fileName)
        return url
    }
    
    
    
}

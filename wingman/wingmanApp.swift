//
//  wingmanApp.swift
//  wingman
//
//  Created by yangjiaqi08 on 2021/11/30.
//

import SwiftUI

@main
struct wingmanApp: App {
    @StateObject private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
                .frame(minWidth: 700, minHeight: 300)
                .onOpenURL { url in
                    let dict = url.description.tt_urlQueryDict()
                    print(dict)
                }
        }
        
    }
}


extension String {
    func tt_urlQueryDict() -> [String: String] {
        var dict = [String: String]()
        guard let queryItems = URLComponents(string:  self)?.queryItems
        else{
            return dict
        }
        for qi in queryItems {
            let key = qi.name
            let value = qi.value
            dict[key] = value
        }
        return dict
    }
}

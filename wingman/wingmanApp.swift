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
        WindowGroup("kumiko") {
            ContentView()
                .handlesExternalEvents(preferring: Set(arrayLiteral: "MainView"), allowing: Set(arrayLiteral: "*"))
                .environmentObject(modelData)
                .onOpenURL { url in
                    let dict = url.description.tt_urlQueryDict()
                    BangumiAccountRequestParams.shared.getAccessToken(postData: dict)
                }
        }
        .commands {
            CommandGroup(replacing: .newItem, addition: {})
        }
        .handlesExternalEvents(matching: Set(arrayLiteral: "MainView"))
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

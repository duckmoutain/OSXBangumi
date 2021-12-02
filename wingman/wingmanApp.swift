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
        }
    }
}

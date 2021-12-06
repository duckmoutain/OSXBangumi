//
//  ContentView.swift
//  wingman
//
//  Created by yangjiaqi08 on 2021/11/30.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            LandmarkList()
            noSelectView()
            BangumiNoUser()
        }
    }
}

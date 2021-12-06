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
                .frame(minWidth: 300, minHeight: 300)
            noSelectView()
                .frame(minWidth: 400, minHeight: 300)
            BangumiUserInfo()
                .frame(minWidth: 400, minHeight: 300)
        }
    }
}

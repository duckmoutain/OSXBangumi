//
//  ContentView.swift
//  wingman
//
//  Created by yangjiaqi08 on 2021/11/30.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack{
            MapView()
                .frame(height: 300)
            
            Profile()
                .offset(y: -130)
                .padding(.bottom, -130)
            
            VStack(alignment: .leading){
                Text("響け!")
                    .font(.title)
                
                HStack{
                    Text("ユーフォニアム")
                        .font(.subheadline)
                    Spacer()
                    Text("北宇治高校")
                }
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .frame(width: 700, height: 300)
    }
}

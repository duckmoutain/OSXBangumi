//
//  InfoBtn.swift
//  wingman
//
//  Created by yangjiaqi08 on 2021/12/5.
//

import SwiftUI

struct InfoBtn: View {
    var body: some View {
        VStack(alignment: .leading){
            Button {
                BangumiAccountRequestParams.shared.printInfo(type: .accessToken)
            } label: {
                Label("查看accessToken", systemImage: "eye")
                    .labelStyle(.automatic)
            }
            Button {
                BangumiAccountRequestParams.shared.printInfo(type: .userId)
            } label: {
                Label("查看userId", systemImage: "eye")
                    .labelStyle(.automatic)
            }
        }
    }
}

struct InfoBtn_Previews: PreviewProvider {
    static var previews: some View {
        InfoBtn()
    }
}

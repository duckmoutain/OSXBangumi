//
//  BangumiUserInfo.swift
//  wingman
//
//  Created by yangjiaqi08 on 2021/12/6.
//

import SwiftUI

struct BangumiUserInfo: View {
    var body: some View {
        VStack {
            Section("Bangumi") {
                Link("登陆Bangumi", destination:  BangumiAccountRequestParams.shared.getAuthorizeCodeUrl()!)
                InfoBtn()
            }
        }
    }
}

struct BangumiUserInfo_Previews: PreviewProvider {
    static var previews: some View {
        BangumiUserInfo()
    }
}

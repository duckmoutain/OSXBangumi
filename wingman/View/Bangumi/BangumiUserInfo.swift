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
            Section("账户信息") {
                BangumiAccountInfo(accountInfo: BangumiAccountRequestParams.shared.account_info)
            }
        }
    }
}

struct BangumiAccountInfo: View {
    
    var accountInfo: AccountInfo
    
    var body: some View {
        if((accountInfo.id) != nil)
       {
            Text("称呼 \(accountInfo.username!)")
            Text("昵称 \(accountInfo.nickname!)")
            Text("签名 \(accountInfo.sign!)")
            accountInfo.headImage
        }
    }
}

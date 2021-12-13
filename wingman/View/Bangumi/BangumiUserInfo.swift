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
                BangumiAccountInfo()
            }
        }
    }
}

struct BangumiAccountInfo: View {
    @StateObject private var bangumi = BangumiAccountRequestParams.shared
    
    var body: some View {
        HStack{
            bangumi.account_info.headImage
            VStack(alignment: .leading){
                Text("称呼 \(bangumi.account_info.username!)")
                Text("昵称 \(bangumi.account_info.nickname!)")
                Text("签名 \(bangumi.account_info.sign!)")
            }
        }
    }
}

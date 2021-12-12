//
//  AccountInfo.swift
//  wingman
//
//  Created by yangjiaqi08 on 2021/12/6.
//

import Foundation
import SwiftUI

struct BangumiTokenInfo: Hashable, Codable {
    
    var access_token: String?
    var user_id: Int?
    var expires_in: Int?
    var refresh_token:String?
    var token_type:String?
    
}

struct AccountRequestInfo: Hashable {
    let BaseUrl = "https://bgm.tv/oauth/authorize"
    let access_url = "https://bgm.tv/oauth/access_token"
    let client_id = "bgm208161a865facb1e2"
    let response_type = "code"
    let client_secret = "7f914c10cc4ba6351e933ff031b5786b"
    let grant_type = "authorization_code"
    let redirect_uri = "wingman://kumiko.com/"
}


struct AccountInfo: Hashable, Codable {
    var id: Int?
    var url: String?
    var username: String?
    var nickname: String?
    
    var avatar: Dictionary<String, String>?
    
    var sign: String?
    var usergroup: Int?
    
    var headImage: Image {
        let url : URL = URL.init(string: avatar?["small"] ?? "")! // 初始化url图片

        let data : NSData! = NSData(contentsOf: url) //转为data类型

        if data != nil { //判断data不为空，这里是因为swift对类型要求很严，如果未空的话，会崩溃
            let image = NSImage(data: data as Data)
            return Image(nsImage: image!)
        }
        return Image("4180")
    }
    
}

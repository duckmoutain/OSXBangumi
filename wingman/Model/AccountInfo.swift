//
//  AccountInfo.swift
//  wingman
//
//  Created by yangjiaqi08 on 2021/12/6.
//

import Foundation

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
    
    var avatar: Avatar?
    
    var sign: String?
    var usergroup: Int?
    
}

struct Avatar: Hashable, Codable {
    var large: String?
    var mediumL: String?
    var small: String?
}

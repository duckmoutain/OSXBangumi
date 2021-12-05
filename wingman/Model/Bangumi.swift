//
//  Bangumi.swift
//  wingman
//
//  Created by yangjiaqi08 on 2021/12/3.
//

import Foundation

final class BangumiAccountRequestParams {
    
    static let shared = BangumiAccountRequestParams()
    
    private let BaseUrl = "https://bgm.tv/oauth/authorize"
    private let client_id = "bgm208161a865facb1e2"
    private let response_type = "code"
    private let access_token: String = ""
    
    private init() {}
    
    func getAuthorizeCodeUrl() -> URL? {
        return URL(string: "\(BaseUrl)?client_id=\(client_id)&response_type=\(response_type)")
    }
    
//    func getAccessToken() -> Void {
//        
//    }
    
}

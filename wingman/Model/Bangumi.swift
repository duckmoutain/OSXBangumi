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
    private let client_secret = "7f914c10cc4ba6351e933ff031b5786b"
    
    
    private var access_token: String = ""
    private var user_id = 0
    private var expires_in = 0
    private var refresh_token = ""
    private var token_type = "Bearer"
    
    private init() {}
    
    enum Info {
        case accessToken
        case userId
        case expiresIn
        case refreshToken
        case tokenType
    }
    
    func printInfo(type: Info) -> Void {
        switch type
        {
            case .accessToken:
                print(access_token)
            case .userId:
                print(user_id)
            default:
                print(111)
        }
    }
    
    func getAuthorizeCodeUrl() -> URL? {
        return URL(string: "\(BaseUrl)?client_id=\(client_id)&response_type=\(response_type)")
    }
    
    func getAccessToken(postData: Dictionary<String, Any>) -> Void {
        let base_url = "https://bgm.tv/oauth/access_token"
        var dict = postData
        dict["grant_type"] = "authorization_code"
        dict["client_id"] = client_id
        dict["client_secret"] = client_secret
        dict["redirect_uri"] = "wingman://kumiko.com/"
        let task = makePostRequest(url: base_url, postData: dict)
        task.resume()
    }
    
    func makePostRequest( url: String, postData: Dictionary<String, Any> ) -> URLSessionDataTask {
        let session = URLSession(configuration: .ephemeral)
        
        var request = URLRequest(url: URL(string: url)!)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        
        request.httpBody = try? JSONSerialization.data(withJSONObject: postData)
        
        let task = session.dataTask(with: request, completionHandler: { [self](data, response, error) in
            do {
                if(error != nil){
                    print(error!)
                    return
                }
                let r = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as! NSDictionary
                print(r)
                self.access_token = r["access_token"] as! String
                self.user_id = r["user_id"] as! Int
                self.expires_in = r["expires_in"] as! Int
                self.refresh_token = r["refresh_token"] as! String
            } catch {
                print("无法连接到服务器")
                return
            }
        })
        return task
    }
    
}

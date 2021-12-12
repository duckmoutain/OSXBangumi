//
//  Bangumi.swift
//  wingman
//
//  Created by yangjiaqi08 on 2021/12/3.
//

import Foundation


final class BangumiAccountRequestParams {
    
    static let shared = BangumiAccountRequestParams()
    
    private let request_info: AccountRequestInfo
    private var token_info: BangumiTokenInfo
    var account_info: AccountInfo
    
    private init() {
        request_info = AccountRequestInfo()
        token_info = BangumiTokenInfo()
        account_info = AccountInfo()
    }
    
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
                print(token_info.access_token ?? "不存在Token")
            case .userId:
                print(token_info.user_id ?? "不存在userId")
            default:
                print(111)
        }
    }
    
    func getAuthorizeCodeUrl() -> URL? {
        return URL(string: "\(request_info.BaseUrl)?client_id=\(request_info.client_id)&response_type=\(request_info.response_type)")
    }
    
    func getAccessToken(postData: Dictionary<String, Any>) -> Void {
        let base_url = request_info.access_url
        var dict = postData
        dict["grant_type"] = request_info.grant_type
        dict["client_id"] = request_info.client_id
        dict["client_secret"] = request_info.client_secret
        dict["redirect_uri"] = request_info.redirect_uri
        let task = makePostRequest(url: base_url, postData: dict)
        task.resume()
    }
    
    func getUserInfo(userId: Int) {
        let session = URLSession(configuration: .default)
        let url = "https://api.bgm.tv/user/\(userId)"
        
        let UrlRequest = URLRequest(url: URL(string: url)!)
        
        let task = session.dataTask(with: UrlRequest) { [self](data, response, error) in
            do {
                let decoder = JSONDecoder()
                account_info = try decoder.decode(AccountInfo.self, from: data!)
                print(account_info)
            } catch {
                // 如果连接失败就...
                print("无法连接到服务器")
                return
            }
        }
        // 运行此任务
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
                let decoder = JSONDecoder()
                token_info = try decoder.decode(BangumiTokenInfo.self, from: data!)
                getUserInfo(userId: token_info.user_id!)
            } catch {
                print("无法连接到服务器 \(response!)")
                return
            }
        })
        return task
    }
    
}

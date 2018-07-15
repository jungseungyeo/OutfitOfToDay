//
//  Network.swift
//  OutfitOfTheDay
//
//  Created by Jung seoung Yeo on 2018. 6. 13..
//  Copyright © 2018년 LinSaeng. All rights reserved.
//

import Alamofire
import SwiftyJSON
import ObjectMapper

final class NetWork {
    
    static let shared = NetWork()
    private init() { }
    
    private var alamoFireManager = Alamofire.SessionManager.default
    
    typealias requestCompletionHandler = (Mappable?) -> Void
    
    func request(for requestName: OOTRequestName, parameters: [String: Any] = [:] , completion: @escaping requestCompletionHandler) {
        
        let requestInfo = requestName.getRequestInfo()
        let parameters = parameters
        
        // 요청 시작
        self.alamoFireManager.request(requestInfo.urlString , method: requestInfo.method, parameters: parameters, headers: ["content-Type":"application/json"]).validate().response { (response) in
           
            
            // 응답 처리
            let statusCode = (response.response)?.statusCode ?? 0
            
            guard let data = response.data, let jsonString: String = String(data: data, encoding: .utf8), statusCode != 0 || statusCode > 200 || statusCode < 300 else {
                // 알람
                print("error : \(statusCode)")
                return
            }
            
            if let responseObject = requestInfo.returnClass.init(JSONString: jsonString) {
                completion(responseObject)
                return
            }
            
            //  알람
            print("error : \(statusCode)")
        }
    }
    
    func requestGet(for requestName: OOTRequestName, parameters: [String: Any] = [:], completion: requestCompletionHandler) {
        
    }
}

enum OOTRequestName: String {

    case temperature
    case dust
    case background
    
    // 요청 보낼 URL, HTTP 메소드, 응답으로 받을 데이터를 맵핑할 클래스
    func getRequestInfo() -> (urlString: String, method: HTTPMethod, returnClass: Mappable.Type) {
        switch self {
        case .temperature:
            return (OOT.NETWORK.temperatures.description, .get, OOTTemperatureData.self)
            
        case .dust:
            return (OOT.NETWORK.dusts.description, .get, OOTDustData.self)
        
        case .background:
            return (OOT.NETWORK.background.description, .get, OOTBackgroundData.self)
        }
    }
}

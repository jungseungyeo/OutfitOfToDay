//
//  OOTService.swift
//  outfitoftoday
//
//  Created by Jung seoung Yeo on 2018. 7. 27..
//  Copyright © 2018년 LinSaeng. All rights reserved.
//

import Alamofire
import SwiftyJSON
import NVActivityIndicatorView

class OOTWeatherService {
	static let shared: OOTWeatherService = OOTWeatherService()
	
	private init() { }
	
	private let headers = ["Content-Type":"application/json"]
	
	enum path: CustomStringConvertible {
		case baseURL
		case backgrounds
		case temperatures
		case dayTime
		case discomfort
		case humidity
		case dust
		case wind
		case rain
		case windChill
		case uv
		
		case hour // 3시간 단위 그래프용
		case week // 하루 단위 1주일치 그래프용
		
		var description: String {
			switch self {
			case .baseURL:
				return "http://oot.depromeet.com:8080/"
			case .backgrounds:
				return "\(OOTWeatherService.path.baseURL.description)backgrounds"
			case .temperatures:
				return "\(OOTWeatherService.path.baseURL.description)temperatures"
			case .dayTime:
				return "\(OOTWeatherService.path.baseURL.description)dayTime"
			case .discomfort:
				return "\(OOTWeatherService.path.baseURL.description)discomfort"
			case .humidity:
				return "\(OOTWeatherService.path.baseURL.description)humidity"
			case .dust:
				return "\(OOTWeatherService.path.baseURL.description)dust"
			case .wind:
				return "\(OOTWeatherService.path.baseURL.description)wind"
			case .rain:
				return "\(OOTWeatherService.path.baseURL.description)rain"
			case .windChill:
				return "\(OOTWeatherService.path.baseURL.description)wind-chill"
			case .uv:
				return "\(OOTWeatherService.path.baseURL.description)uv"
			case .hour:
				return "\(OOTWeatherService.path.baseURL.description)hour"
			case .week:
				return "\(OOTWeatherService.path.baseURL.description)week"
			}
		}
	}
	
	internal func get(urlPath: OOTWeatherService.path, parameters: [String : Any] = [:], handler: @escaping (JSON) -> Void, errorHandler: @escaping (Int, Error?) -> Void) {
		Alamofire.request(urlPath.description, method: .get, parameters: parameters,encoding: URLEncoding.default, headers: headers).responseJSON { response in
			
			guard let statusCode = response.response?.statusCode else {
				errorHandler(-999, response.error)
				return
			}
			
			guard let data = response.data else {
				errorHandler(statusCode, response.error)
				return
			}
			switch statusCode {
			case 200:
				handler(JSON(data))
			default:
				errorHandler(statusCode, response.error)
			}
		}
	}
	
	internal func post(urlPath: OOTWeatherService.path, parameters: [String : Any] = [:], headers: HTTPHeaders = SessionManager.defaultHTTPHeaders, handler: @escaping (JSON) -> Void, errorHandler: @escaping (Int, Error?) -> Void){
		let path = urlPath.description
		
		Alamofire.request(path, method: .get, parameters: parameters ,encoding: JSONEncoding.prettyPrinted, headers: headers).responseJSON { response in
			
			guard let statusCode = response.response?.statusCode else {
				errorHandler(-999, response.error)
				return
			}
			
			guard let data = response.data else {
				errorHandler(statusCode, response.error)
				return
			}
			switch statusCode {
			case 200:
				handler(JSON(data))
			default:
				errorHandler(statusCode, response.error)
			}
		}
	}
}

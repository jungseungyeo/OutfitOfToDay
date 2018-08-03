//
//  DescriptionInfo
//  outfitoftoday
//
//  Created by Goodnews on 2018. 8. 3..
//  Copyright © 2018년 LinSaeng. All rights reserved.
//

import Foundation

struct DescriptionInfo: Codable {
	let uv: Int
	let humidity: Int
	let dust: Int
	let rain: Int
	let wind: Int
	let discomfort: Int
	let windChill: Int
}

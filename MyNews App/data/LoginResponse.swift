 
import Foundation
struct LoginResponse : Codable {
	let data : [Data]?

	enum CodingKeys: String, CodingKey {
		case data = "data"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		data = try values.decodeIfPresent([Data].self, forKey: .data)
	}

}

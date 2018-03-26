 
import Foundation
struct LoginChildData : Decodable {
	let status : Int?
	let message : String?
	let uid : Int?
	let state : Int?
	let name : String?
	let username : String?
	let pic : String?
	let total_points : Int?

	enum CodingKeys: String, CodingKey {

		case status = "status"
		case message = "message"
		case uid = "uid"
		case state = "state"
		case name = "name"
		case username = "username"
		case pic = "pic"
		case total_points = "total_points"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		status = try values.decodeIfPresent(Int.self, forKey: .status)
		message = try values.decodeIfPresent(String.self, forKey: .message)
		uid = try values.decodeIfPresent(Int.self, forKey: .uid)
		state = try values.decodeIfPresent(Int.self, forKey: .state)
		name = try values.decodeIfPresent(String.self, forKey: .name)
		username = try values.decodeIfPresent(String.self, forKey: .username)
		pic = try values.decodeIfPresent(String.self, forKey: .pic)
		total_points = try values.decodeIfPresent(Int.self, forKey: .total_points)
	}

}

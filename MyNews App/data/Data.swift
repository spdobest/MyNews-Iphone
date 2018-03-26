 
import Foundation
struct Data : Decodable {
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
}

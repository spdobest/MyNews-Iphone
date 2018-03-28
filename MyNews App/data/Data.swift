 
import Foundation
 
 /*
  {"data":[{"status":"1","message":"Login successfully","uid":"1442","state":"17","name":"Maharashtra",
  "username":"spm","pic":"","total_points":"0"}]}
  */
 
struct Data : Codable {
	let status : String?
	let message : String?
	let uid : String?
	let state : String?
	let name : String?
	let username : String?
	let pic : String?
	let total_points : String?

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

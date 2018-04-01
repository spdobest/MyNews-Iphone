import Foundation
struct NewsResponse : Decodable {
	let data : [NewsData]?

	enum CodingKeys: String, CodingKey {

		case data = "data"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		data = try values.decodeIfPresent([NewsData].self, forKey: .data)
	}

}

struct NewsData : Decodable {
    let id : String?
    let title : String?
    let description : String?
    let newsimage : String?
    let likecnt : Int?
    let like : Int?
    let uploadedDate : String?
    
    enum CodingKeys: String, CodingKey {
        
        case id = "id"
        case title = "title"
        case description = "description"
        case newsimage = "newsimage"
        case likecnt = "likecnt"
        case like = "like"
        case uploadedDate = "uploadedDate"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(String.self, forKey: .id)
        title = try values.decodeIfPresent(String.self, forKey: .title)
        description = try values.decodeIfPresent(String.self, forKey: .description)
        newsimage = try values.decodeIfPresent(String.self, forKey: .newsimage)
        likecnt = try values.decodeIfPresent(Int.self, forKey: .likecnt)
        like = try values.decodeIfPresent(Int.self, forKey: .like)
        uploadedDate = try values.decodeIfPresent(String.self, forKey: .uploadedDate)
    }
    
}

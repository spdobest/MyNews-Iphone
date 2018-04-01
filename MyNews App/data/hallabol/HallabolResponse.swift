import Foundation
struct HallabolResponse : Decodable {
    let success : Int?
    let result : [HallabolData]?
    
    enum CodingKeys: String, CodingKey {
        case success = "success"
        case result = "result"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        success = try values.decodeIfPresent(Int.self, forKey: .success)
        result = try values.decodeIfPresent([HallabolData].self, forKey: .result)
    }
    
}

struct HallabolData : Decodable {
    let id : Int?
    let title : String?
    let description : String?
    let image : String?
    let dateCreated : String?
    
    enum CodingKeys: String, CodingKey {
        
        case id = "id"
        case title = "title"
        case description = "description"
        case image = "image"
        case dateCreated = "dateCreated"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        title = try values.decodeIfPresent(String.self, forKey: .title)
        description = try values.decodeIfPresent(String.self, forKey: .description)
        image = try values.decodeIfPresent(String.self, forKey: .image)
        dateCreated = try values.decodeIfPresent(String.self, forKey: .dateCreated)
    }
    
} 

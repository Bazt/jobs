import Foundation
import SwiftyJSON

class PositionsParser {
    enum JsonKey: String {
        case title = "title"
        case location = "location"
        case description = "description"
        case company_logo = "company_logo"
    }
    
    class func parseJsonFrom(string: String) -> [Position] {
        let json = JSON(parseJSON: string)
        return json.arrayValue.map({ parse(item: $0)! })
    }
    
    private class func parse(item itemJson: JSON) -> Position? {
        guard let title = itemJson[JsonKey.title.rawValue].string,
              let location = itemJson[JsonKey.location.rawValue].string,
              let description = itemJson[JsonKey.description.rawValue].string else {
            return nil
        }
        
        let logoPath = itemJson[JsonKey.company_logo.rawValue].string
        return Position(title: title, city: location, path: logoPath, description: description)
    }
}

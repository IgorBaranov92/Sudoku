import Foundation

struct Options: Codable {
    
    var options = [String:Bool]()
    
    var descriptions = [String:String]()
    
    var json: Data? {
        return try? JSONEncoder().encode(self)
    }
    
    init?(json:Data) {
        if let data = try? JSONDecoder().decode(Options.self, from: json) {
            self = data
        }
    }
    
    
    init() {
        options[Keys.mistakesLimit] = true
        options[Keys.mistakesCheck] = true
        options[Keys.areaSelection] = true
        options[Keys.hideDigits] = true

        descriptions[Keys.mistakesLimit] = localized("mistakesLimit")
        descriptions[Keys.mistakesCheck] = localized("mistakesCheck")
        descriptions[Keys.areaSelection] = localized("areaSelection")
        descriptions[Keys.hideDigits] = localized("hideDigits")
        
    }
    
}

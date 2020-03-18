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
        options[Keys.timer] = false

        descriptions[Keys.mistakesLimit] = Keys.mistakesLimit
        descriptions[Keys.mistakesCheck] = Keys.mistakesCheck
        descriptions[Keys.areaSelection] = Keys.areaSelection
        descriptions[Keys.hideDigits] = Keys.hideDigits
        descriptions[Keys.timer] = Keys.timer

    }
    
}

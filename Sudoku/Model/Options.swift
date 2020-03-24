import Foundation

struct Options: Codable {
    
    var options = [Bool]()
    
    var descriptions = [String]()
    
    private(set) var identity = ["mistakeslimit","mistakescheck","areaselection","smarthints","hidedigits"]
    
    var json: Data? {
        return try? JSONEncoder().encode(self)
    }
    
    init?(json:Data) {
        if let data = try? JSONDecoder().decode(Options.self, from: json) {
            self = data
        }
    }
    
//mistakes limit
//check mistakes
//area selection
//smart hints
//hide digits
    
    init() {
        options = [true,true,true,true,true]
        descriptions = identity
        
    }
    
}

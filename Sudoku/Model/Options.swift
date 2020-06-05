import Foundation

struct Options: Codable {
    //mistakes limit
    //check mistakes
    //area selection
    //smart hints
    //hide digits
    var options = [Bool]()
    
    var json: Data? {
        return try? JSONEncoder().encode(self)
    }
    
    init?(json:Data) {
        if let data = try? JSONDecoder().decode(Options.self, from: json) {
            self = data
        }
    }

    init() {
        options = [true,true,true,true,true]
    }
    
}

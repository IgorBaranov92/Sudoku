import Foundation

struct Game:Codable {
    
    var games = [Int:SudokuGenerator]()
    
    var json: Data? {
        return try? JSONEncoder().encode(self)
    }
    
    init?(json:Data) {
        if let validJson = try? JSONDecoder().decode(Game.self, from: json) {
            self = validJson
        }
    }
    
    init() {}
}

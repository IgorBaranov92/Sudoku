import Foundation

//mistakesMade
//hintsUsed
//gameWon
//gameLost

struct Statistic: Codable {
    
    static let difficult = [localized("easy"),localized("medium"),localized("hard")]
    
    var scores = Array(repeating: Scores(), count: 6)
        
    var json: Data? { try? JSONEncoder().encode(self) }

    init() {}
    
    init?(json:Data){
        if let newValue = try? JSONDecoder().decode(Statistic.self, from: json) {
            self = newValue
        }
    }
 
    struct Scores: Codable {

        var scores = [[0,0,0,0],[0,0,0,0],[0,0,0,0]]
        
        let descriptions = [localized("mistakesMade"),localized("hintsUsed"),localized("gameWon"),localized("gameLost")]
    }
    
}




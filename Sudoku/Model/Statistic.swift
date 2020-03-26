import Foundation

//mistakesMade
//hintsUsed
//gameWon
//gameLost

struct Statistic: Codable {
    
    static let difficult = ["easy","medium","hard"]
    
    var scores = Array(repeating: Scores(), count: 4)
        
    var json: Data? { try? JSONEncoder().encode(self) }
    
    
    struct Scores: Codable {

        var scores = [[0,0,0,0],[0,0,0,0],[0,0,0,0]]
        
        let descriptions = [localized("mistakesMade"),localized("hintsUsed"),localized("gameWon"),localized("gameLost")]
        
        mutating func updateMistakes(difficult:Int) {
            scores[difficult][0] += 1
        }
        
        mutating func updateHints(difficult:Int) {
            scores[difficult][1] += 1
        }
        
        mutating func updateGameWon(difficult:Int) {
            scores[difficult][2] += 1
        }
        
        mutating func updateGameLost(difficult:Int) {
            scores[difficult][3] += 1
        }
        
    }
     
    init() {}
    
    init?(json:Data){
        if let newValue = try? JSONDecoder().decode(Statistic.self, from: json) {
            self = newValue
        }
    }
    
}


enum GameType: Int,Codable {
    case classic = 0
    case diagonal = 1
    case twoDiagonals = 2
    case romb = 3
}

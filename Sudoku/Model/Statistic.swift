import Foundation

//mistakesMade
//hintsUsed
//gameWon
//gameLost
//best time

struct Statistic: Codable {
    
    static let difficult = ["easy","medium","hard"]
    
    static subscript(_ i:Int) -> GameType {
        return GameType(rawValue: i) ?? .classic
    }
    
    
    var scoresFor:[GameType:Scores] = [
        .classic:Scores(),
        .diagonal:Scores(),
        .twoDiagonals:Scores(),
        .romb:Scores(),
        .evenOdd:Scores(),
        .fence:Scores()
    ]
        
    var json: Data? { try? JSONEncoder().encode(self) }
    
    init() {}
    
    init?(json:Data){
        if let newValue = try? JSONDecoder().decode(Statistic.self, from: json) {
            self = newValue
        }
    }
    
    struct Scores: Codable {

        var scores = [[0,0,0,0,0],[0,0,0,0,0],[0,0,0,0,0]]
        
        let descriptions = [localized("mistakesMade"),localized("hintsUsed"),localized("gameWon"),localized("gameLost"),localized("besttime")]
        
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
        
        mutating func updateBestTime(difficult:Int) {
            scores[difficult][4] += 1
        }
        
    }
     
}


enum GameType: Int,Codable {
    case classic = 0
    case diagonal = 1
    case twoDiagonals = 2
    case romb = 3
    case evenOdd = 4
    case fence = 5
}

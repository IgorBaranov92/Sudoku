import Foundation

struct Statistic: Codable {
    
    var scoresFor:[GameType:Scores] = [
        .classic:Scores(),
        .diagonal:Scores(),
        .twoDiagonals:Scores(),
        .romb:Scores(),
        .evenOdd:Scores(),
        .fence:Scores()
    ]
    
    private(set) var gameTypes:[GameType] = [GameType.classic,.diagonal,.twoDiagonals,.romb,.evenOdd,.fence]
    
    var json: Data? { try? JSONEncoder().encode(self) }
    
    init() {}
    
    init?(json:Data){
        if let newValue = try? JSONDecoder().decode(Statistic.self, from: json) {
            self = newValue
        }
    }
    
    struct Scores: Codable {

//mistakesMade
//hintsUsed
//gameWon
//gameLost
//best time
        
        var scores = [0,0,0,0,0]
        
        let descriptions = [localized("mistakesMade"),localized("hintsUsed"),localized("gameWon"),localized("gameLost"),localized("besttime")]
        
        mutating func updateMistakes() {
            scores[0] += 1
        }
        
        mutating func updateHints() {
            scores[1] += 1
        }
        
        mutating func updateGameWon() {
            scores[2] += 1
        }
        
        mutating func updateGameLost() {
            scores[3] += 1
        }
        
    }
     
    enum GameType: String,Codable {
        case classic 
        case diagonal
        case twoDiagonals
        case romb
        case evenOdd
        case fence
    }
}



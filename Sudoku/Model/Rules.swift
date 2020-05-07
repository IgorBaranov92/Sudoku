import Foundation

final class Rules {
    
    static func getRulesDescriptionBasedOn(_ gameType:GameType) -> String {
        switch gameType {
        case .classic:
            return "classicRules"
        case .diagonal:
            return "diagonalRules"
        case .twoDiagonals:
            return "twoDiagonalsRules"
        case .romb:
            return "hexagonRules"
        case .hexagon:
            return "rombRules"
        case .shape:
            return "shapeRules"
        }
    }
    
    private static var basicDescription: String {
        return " "
    }
    
}

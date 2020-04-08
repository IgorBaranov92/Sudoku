import Foundation

final class Rules {
    
    static func getRulesDescriptionBasedOn(_ gameType:GameType) -> String {
        switch gameType {
        case .classic:
            return localized("classicRules")
        case .diagonal:
            return localized("diagonalRules")
        case .twoDiagonals:
            return localized("twoDiagonalsRules")
        case .romb:
            return localized("rombRules")
        case .shape:
            return localized("shapeRules")
        }
    }
    
}

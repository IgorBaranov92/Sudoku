import Foundation

func localized(_ key:String) -> String {
    return NSLocalizedString(key, comment: " ")
}


enum GameType: Int,Codable {
    case classic = 0
    case diagonal = 1
    case twoDiagonals = 2
    case romb = 3
    case shape = 4
}

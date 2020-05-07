import Foundation

final class Rules {
    
    static func getRulesDescriptionBasedOn(_ gameType:GameType) -> String {
        switch gameType {
        case .classic:
            return desc1 + desc2
        case .diagonal:
            return desc1 + "в каждой из двух диагоналей, " + desc2
        case .twoDiagonals:
            return desc1 + "в каждой из четырех диагоналей, " + desc2
        case .romb:
            return desc1 + desc2
        case .hexagon:
            return desc1 + "в каждой вершине октагона " + desc2
        case .shape:
            return "Заполните свободные клетки цифрами от 1 до 9 так, чтобы в каждой строке, в каждом столбце, в каждом блоке каждая цифра встречалась один раз."
        }
    }
    
    private static var desc1: String {
        return "Заполните свободные клетки цифрами от 1 до 9 так, чтобы в каждой строке, в каждом столбце, в каждом квадрате 3х3, "
    }
    
    private static var desc2: String {
        return "каждая цифра встречалась только один раз."
    }
}

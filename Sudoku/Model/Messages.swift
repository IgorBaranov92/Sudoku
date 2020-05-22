import Foundation


final class Messages {
    
    static func getVictoryMessageWith(_ gameType:GameType,difficult:SudokuGenerator.Difficult) -> String {
        switch gameType {
        case .classic:
            switch difficult {
            case .easy: return "Вы успешно решили судоку-классика на легком уровне."
            case .medium:return "Вы успешно решили судоку-классика на среднем уровне."
            case .hard:return "Вы успешно решили судоку-классика на тяжелом уровне."
            case .expert:return "Вы успешно решили судоку-классика на экспертном уровне."
            }
        case .diagonal:
            switch difficult {
            case .easy: return "Вы успешно решили судоку-диагональ на легком уровне."
            case .medium:return "Вы успешно решили судоку-диагональ на среднем уровне."
            case .hard:return "Вы успешно решили судоку-диагональ на тяжелом уровне."
            case .expert:return "Вы успешно решили судоку-диагональ на экспертном уровне."
            }
        case .twoDiagonals:
            switch difficult {
            case .easy: return "Вы успешно решили судоку-две диагонали на легком уровне."
            case .medium:return "Вы успешно решили судоку-две диагонали на среднем уровне."
            case .hard:return "Вы успешно решили судоку-две диагонали на тяжелом уровне."
            case .expert:return "Вы успешно решили судоку-две диагонали на экспертном уровне."
            }
        case .romb:
            switch difficult {
            case .easy: return "Вы успешно решили судоку-ромб на легком уровне."
            case .medium:return "Вы успешно решили судоку-ромб на среднем уровне."
            case .hard:return "Вы успешно решили судоку-ромб на тяжелом уровне."
            case .expert:return "Вы успешно решили судоку-ромб на экспертном уровне."
            }
        case .hexagon:
            switch difficult {
            case .easy: return "Вы успешно решили судоку-октагон на легком уровне."
            case .medium:return "Вы успешно решили судоку-октагон на среднем уровне."
            case .hard:return "Вы успешно решили судоку-октагон на тяжелом уровне."
            case .expert:return "Вы успешно решили судоку-октагон на экспертном уровне."
            }
        case .shape:
            switch difficult {
            case .easy: return "Вы успешно решили судоку-фигуры на легком уровне."
            case .medium:return "Вы успешно решили судоку-фигуры на среднем уровне."
            case .hard:return "Вы успешно решили судоку-фигуры на тяжелом уровне."
            case .expert:return "Вы успешно решили судоку-фигуры на экспертном уровне."
            }
        }
    }
    
    
}

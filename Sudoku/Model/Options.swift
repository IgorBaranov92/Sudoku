import Foundation

struct Options: Codable {
    
    var options = [Bool]()
    
    var descriptions = [String]()
    
    private(set) var optionsOnDescription = ["В каждой игре допускается совершить три ошибки","Выделять неправильно поставленную цифру","Выделяет строку, столбец, квадрат 3х3 для текущей клетки","smarthints","Скрывать использованные цифры(расставлены все единицы или двойки)"]
    
    private(set) var optionsOffDescription = ["Допускается любое количество ошибок","Не выделять неправильно поставленную цифру","Выделяет только выбранную клетку","","Не скрывать использованные цифры"]

    
    var json: Data? {
        return try? JSONEncoder().encode(self)
    }
    
    init?(json:Data) {
        if let data = try? JSONDecoder().decode(Options.self, from: json) {
            self = data
        }
    }
    
//mistakes limit
//check mistakes
//area selection
//smart hints
//hide digits
    
    init() {
        options = [true,true,true,true,true]
        descriptions = optionsOnDescription
    }
    
}

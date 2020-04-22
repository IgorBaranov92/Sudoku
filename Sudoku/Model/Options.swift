import Foundation

struct Options: Codable {
    
    var options = [Bool]()
    
    var descriptions = [String]()
    
    private(set) var optionsOnDescription = ["В зависимости от уровня сложности допускается совершить определенное количество ошибок","Выделять неправильно поставленную цифру","При нажатии на","smarthints","hidedigits"]
    
    private(set) var optionsOffDescription = ["Допускается любое количество ошибок","Не выделять неправильно поставленную цифру","","","Не прятать использованные цифры"]

    
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

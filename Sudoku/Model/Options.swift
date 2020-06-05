import Foundation

struct Options: Codable {
    
    var options = [Bool]()
    
    var descriptions = [String]()
    
    private(set) var optionsOnDescription = ["В каждой игре допускается совершить три ошибки","Выделять неправильно поставленную цифру","Выделять все области, где цифра не должна повториться (строка, столбец, диагональ и тд)","При нажатии на цифру в нижней части экрана выделять все области где эта цифра не может быть расставлена","Скрывать цифры, расставленные 9 раз"]
    
    private(set) var optionsOffDescription = ["Допускается любое количество ошибок","Не выделять неправильно поставленную цифру","Выделять только выбранную клетку","При нажатии на цифру в нижней части экрана выделять","Не скрывать цифры, расставленные 9 раз"]

    
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

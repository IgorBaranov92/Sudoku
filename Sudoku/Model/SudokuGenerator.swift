import Foundation

class SudokuGenerator: Sudoku {
    
    var difficult: Difficult = .easy
    var gameCompleted: Bool { digits.filter { $0 == 0 }.isEmpty } //all cells solved
    var completion: (() -> () )?
    
    weak var delegate: SudokuDelegate?
    
    private(set) var digitsCount = [Int:Int]()
    private(set) var mistakes = 0
    private(set) var mistakesMade = [Int?]()
    private(set) var hintsMade = 0
    private(set) var hints = 0
    private let solver = SudokuSolver()

          
    init(difficult:Int, delegate: SudokuDelegate? = nil,completion:(() -> ())? = nil  ) {
        super.init()
        DispatchQueue.global(qos: .userInitiated).async {
            self.delegate = delegate
            self.completion = completion
            switch difficult {
            case 0: self.difficult = .easy;self.mistakes = 4;self.hints = 4
            case 1: self.difficult = .medium;self.mistakes = 3;self.hints = 3
            case 2: self.difficult = .hard; self.mistakes = 2;self.hints = 2
            default:break
            }
            self.clear()
            self.generate()
        }
   }
    
   
    func cellTouchedAt(index:Int, digit:Int) {
        digits[index] = digit
        digitsCount[digit] = digitsCount[digit]! + 1
        if digits[index] != answers[index] { //mistake
            mistakesMade.append(index)
            if mistakesMade.count == mistakes + 1 { //game lost
                if delegate == nil { fatalError("delegate can't be nil")}
                delegate?.gameLost()
            }
        } else { // line or row or block is right
            checkForAnimationAt(index)
        }
        if gameCompleted {
            if delegate == nil { fatalError("delegate can't be nil")}
            delegate?.gameWon()
        }
   }
   
    func eraseAt(_ index:Int, _ digit:Int) {
        digits[index] = 0
        mistakesMade[mistakesMade.firstIndex(of: index)!] = nil
        digitsCount[digit] = digitsCount[digit]! - 1
   }
   
    func highlightButtons(_ index:Int) -> [Int] {
        var indexes = [Int]()
        let coordinates = self[index]
        let rowOffset = coordinates.row - coordinates.row%3
        let columnOffset = coordinates.column - coordinates.column%3
        for i in 0..<dimension {
            indexes.append(dimension*coordinates.column + i )
            indexes.append(coordinates.row + dimension*i )
            indexes.append(columnOffset*dimension + rowOffset + i/3*dimension + i%3)
        }
        return indexes.unique()
    }

    func highlightAllButtonsBasedOn(digit:Int) -> (active:[Int],related:[Int]) {
        var output = (active:[Int](),related:[Int]())
        for index in digits.indices {
            if digit == digits[index] {
                let coordinate = self[index]
                output.active.append(index)
                output.related += highlightButtons(coordinate.column*dimension+coordinate.row)
            }
        }
        return output
    }
    
    func hint(index:Int) {
        if hintsMade < hints  {
            if digits[index] == 0 {
                digits[index] = answers[index]
                digitsCount[digits[index]] = digitsCount[digits[index]]! + 1
                hintsMade += 1
                if gameCompleted { delegate?.gameWon()}
            }
        }
    }


    private func generate() {
        let firstRow = [1,2,3,4,5,6,7,8,9].shuffled()
        digits = firstRow + Array(repeating: 0, count: 72)
        createBoard()
        replaceDigits()
        removeDigits()
        calculateDigits()
        completion?()
    }
    

    private func createBoard() {
        solver.digits = digits
        solver.prepareForSolving()
        if solver.solve() {
            digits = solver.answers
        }
    }
    
    private func replaceDigits() {
        let newDigits = [1,2,3,4,5,6,7,8,9].shuffled()
        for index in digits.indices {
            digits[index] = newDigits[digits[index]-1]
        }
        answers = digits
    }
    
    private func removeDigits() {
        var indexesToDelete = Set<Int>()
        while indexesToDelete.count <= difficult.rawValue - 2 {
            let randomRow = Int.random(in: 0...8)
            let randomColumn = Int.random(in: 0...8)
            let symmetricRow = dimension - 1 - randomRow
            let index = randomColumn*dimension+randomRow
            let symmetricIndex = randomColumn*dimension+symmetricRow
            indexesToDelete.insert(index)
            indexesToDelete.insert(symmetricIndex)
        }
        indexesToDelete.forEach { digits[$0] = 0 }
    }
    
    
    private func calculateDigits() {
        for i in 1...9 {
            digitsCount[i] = 0
        }
        for index in digits.indices {
            if digits[index] != 0 {
                digitsCount[digits[index]] = digitsCount[digits[index]]! + 1
            }
        }
    }
    
    private func clear() {
        digits.removeAll()
        answers.removeAll()
        digitsCount.removeAll()
        mistakesMade.removeAll()
    }
    
    private func checkForAnimationAt(_ index:Int) {
        let coordinates = self[index]
        
        if solver.lines[coordinates.row]?.count == 10 { //whole row filled
            let start = coordinates.row*9
            delegate?.animateRowWith([start,start+1,start+2,
                                      start+3,start+4,start+5,
                                      start+6,start+7,start+8])
            
        }
        if solver.columns[coordinates.column]?.count == 10 { //whole column filled
            let start = coordinates.column
            delegate?.animateRowWith([start,start+9,start+18,
                                      start+27,start+36,start+45,
                                      start+54,start+63,start+72])
        }
    }
    
    
    // persistence
    
    required init(from decoder: Decoder) throws {
        super.init()
        let container = try decoder.container(keyedBy: CodingKeys.self)
        hints = try container.decode(Int.self, forKey: .hints)
        hintsMade = try container.decode(Int.self, forKey: .hintsMade)
        mistakes = try container.decode(Int.self, forKey: .mistakes)
        mistakesMade = try container.decode([Int?].self, forKey: .mistakesMade)
        difficult = try container.decode(Difficult.self, forKey: .difficult)
        digits = try container.decode([Int].self, forKey: .digits)
        answers = try container.decode([Int].self, forKey: .answers)
        digitsCount = try container.decode([Int:Int].self, forKey: .digitsCount)
    }
    
    override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(hints, forKey: .hints)
        try container.encode(hintsMade, forKey: .hintsMade)
        try container.encode(mistakes, forKey: .mistakes)
        try container.encode(mistakesMade, forKey: .mistakesMade)
        try container.encode(difficult, forKey: .difficult)
        try container.encode(digits, forKey: .digits)
        try container.encode(answers, forKey: .answers)
        try container.encode(digitsCount, forKey: .digitsCount)
    }
    
    private enum CodingKeys:String,CodingKey {
        case hints = "hints"
        case hintsMade = "hintsMade"
        case mistakes = "mistakes"
        case mistakesMade = "mistakesMade"
        case difficult = "difficult"
        case digits = "digits"
        case answers = "answers"
        case digitsCount = "digitsCount"
        case expert = "expert"
    }
   
}

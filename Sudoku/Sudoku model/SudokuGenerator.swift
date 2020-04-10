import Foundation

class SudokuGenerator: Sudoku {
    
    var difficult: Difficult = .easy
    var gameType: GameType = .classic
    
    private var gameCompleted: Bool { digits.filter { $0 == 0 }.isEmpty } //all cells solved
    
    var completion: (() -> () )?
    
    weak var delegate: SudokuDelegate?
    
    private(set) var digitsCount = [Int:Int]()
    private(set) var mistakes = 0
    private(set) var mistakesMade = [Int?]()
    private(set) var hintsMade = 0
    private(set) var hints = 0
          
    init(difficult:Int,gameType:GameType, delegate: SudokuDelegate? = nil,completion:(() -> ())? = nil  ) {
        super.init()
        DispatchQueue.global(qos: .userInitiated).async { [unowned self] in
            self.delegate = delegate
            self.gameType = gameType
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
    
   
    func cellTouchedAt(index:Int, digit:Int,shouldCountMistakes:Bool) {
        digits[index] = digit
        digitsCount[digit] = digitsCount[digit]! + 1
        if digits[index] != answers[index] { //mistake
            mistakesMade.append(index)
            if shouldCountMistakes {
                if mistakesMade.count == mistakes + 1 { //game lost
                    if delegate == nil { fatalError("delegate can't be nil")}
                    delegate?.gameLost()
                }
            }
            
        }  else { // correct
            checkIfSomethingFilledAt(index)
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
   
    func highlightButtons(_ index:Int) -> Set<Int> {
        var indexes = Set<Int>()
        let coordinates = self[index]
        let rowOffset = coordinates.column - coordinates.column%3
        let columnOffset = coordinates.row - coordinates.row%3
        for i in 0..<dimension {
            indexes.insert(dimension*coordinates.row + i )
            indexes.insert(coordinates.column + dimension*i )
            if gameType != .shape {
                indexes.insert(columnOffset*dimension + rowOffset + i/3*dimension + i%3)
            }
        }
        indexes.formUnion(Indexes.getIndexesBasedOn(gameType, index: index).first)
        indexes.formUnion(Indexes.getIndexesBasedOn(gameType, index: index).second)
        return indexes
    }

    func highlightAllButtonsBasedOn(digit:Int) -> (active:Set<Int>,related:Set<Int>) {
        var output = (active:Set<Int>(),related:Set<Int>())
        for index in digits.indices {
            if digit == digits[index] {
                let coordinate = self[index]
                output.active.insert(index)
            output.related.formUnion(highlightButtons(coordinate.row*dimension+coordinate.column))
                switch gameType {
                case .diagonal:
                    if coordinate.row == coordinate.column { //left
                        output.related.formUnion([0,10,20,30,40,50,60,70,80])
                    }
                    if coordinate.row + coordinate.column == 8 { //right
                        output.related.formUnion([8,16,24,32,40,48,56,64,72])
                    }
                default:break
                }
            }
        }
        print(output.related.count)
        return output
    }
    
    func canHint(index:Int) -> Bool {
        if hintsMade < hints  {
            if digits[index] == 0 {
                digits[index] = answers[index]
                checkIfSomethingFilledAt(index)
                digitsCount[digits[index]] = digitsCount[digits[index]]! + 1
                hintsMade += 1
                if gameCompleted { delegate?.gameWon()}
            }
            return true
        } else {
            delegate?.hintsLimitUsed()
            return false
        }
    }


    private func generate() {
        digits = SudokuSolver.getBaseGridBasedOn(gameType)
        replaceDigits()
        removeDigits()
        calculateDigits()
        completion?()
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
    
    // MARK: - Delegation
    
    private func checkIfSomethingFilledAt(_ index:Int) {
        checkIfRowFilledAt(index)
        checkIfColumnFilledAt(index)
        checkIfBlockFilledAt(index)
        checkIfDiagonalFilledAt(index)
    }
    
    
    private func checkIfRowFilledAt(_ index:Int) {
        let indexes = Indexes.lineIndexesAt(index).filter { digits[$0] != 0 }
        if indexes.count == 9 { delegate?.animateRowWith(indexes) }
    }
    
    private func checkIfColumnFilledAt(_ index:Int) {
        let indexes = Indexes.columnIndexesAt(index).filter { digits[$0] != 0 }
        if indexes.count == 9 { delegate?.animateLineWith(indexes) }
    }
    
    private func checkIfBlockFilledAt(_ index:Int) {
        let indexes = Indexes.blockIndexesAt(index, gameType: gameType).filter { digits[$0] != 0 }
        if indexes.count == 9 { delegate?.animateBlockWith(indexes) }
    }
    
    private func checkIfDiagonalFilledAt(_ index:Int) {
        let firstIndexes = Indexes.getIndexesBasedOn(gameType, index: index).first
        let secondIndexes = Indexes.getIndexesBasedOn(gameType, index: index).second
        if firstIndexes.filter({ digits[$0] != 0 }).count == (gameType == .twoDiagonals ? 8 : 9) {
            delegate?.animateRowWith(firstIndexes)
        }
        if secondIndexes.filter({ digits[$0] != 0 }).count == (gameType == .twoDiagonals ? 8 : 9) {
            delegate?.animateRowWith(secondIndexes)
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
    }
   
}

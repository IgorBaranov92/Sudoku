import Foundation

class SudokuSolver: Sudoku {
    
    var lines = [Int:Set<Int>]()
    var columns = [Int:Set<Int>]()
    var blocks = [Int:Set<Int>]()
    
    override init() {
        super.init()
    }
    
    required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }
    
    // MARK: - Public overridable functions
    
    func prepareForSolving() {
        clear()
        for index in 0...9 {
            lines[index] = Set(arrayLiteral: 0)
            blocks[index] = Set(arrayLiteral: 0)
            columns[index] = Set(arrayLiteral: 9-index)
        }
        lines[0] = Set(arrayLiteral: 1,2,3,4,5,6,7,8,9)
        blocks[0] = Set(arrayLiteral: 9,8,7)
        blocks[1] = Set(arrayLiteral: 6,5,4)
        blocks[2] = Set(arrayLiteral: 3,2,1)
    }
    
    func updateData(insert:Bool,_ row:Int,_ column:Int, _ num:Int) {
        if insert {
            lines[column]!.insert(num)
            columns[row]!.insert(num)
            blocks[row/3+3*(column/3)]!.insert(num)
            
        } else {
            lines[column]!.remove(num)
            columns[row]!.remove(num)
            blocks[row/3+3*(column/3)]!.remove(num)
        }
    }
    
    func isSaveAt(_ i:Int,_ j:Int,_ digit:Int) -> Bool {
       if lines[j]!.contains(digit) || columns[i]!.contains(digit) || blocks[i/3 + 3*(j/3)]!.contains(digit) {
           return false
        }
       return true
    }
    
    @discardableResult
    func solve(_ row:Int = 0,_ column:Int = 0,_ start:Bool = false) -> Bool {
       let firstUnsolvedCell = unsolvableCell(0)
       return solverHelper(firstUnsolvedCell.row, firstUnsolvedCell.column, false)
   }
    
    
    // MARK: - Private
    
     private func solverHelper(_ row:Int,_ column:Int,_ start:Bool) -> Bool {
        if row == 0 && column == 0 && start {
            answers = digits
            return true
        }
        for num in 1...9 {
            if isSaveAt(row, column, num)  {
                self[row,column] = num
                updateData(insert: true, row, column, num)
                let cell = unsolvableCell(column*dimension+row)
                if solverHelper(cell.row, cell.column,true) { return true }
                self[row,column] = 0
                updateData(insert: false, row, column, num)
            }
        }
        return false
    }

    
     // return cell without digit
    private func unsolvableCell(_ base:Int) -> (row:Int,column:Int) {
        let start = base == 0 ? 0 : base + 1
        for index in start..<dimension*dimension {
            if digits[index] == 0 {
                return self[index]
            }
        }
        return (0,0)
    }
    
    private func clear() {
        lines.removeAll()
        columns.removeAll()
        blocks.removeAll()
    }
    
}

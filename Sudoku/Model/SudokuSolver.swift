import Foundation

class SudokuSolver: Sudoku {
    
    private(set) var lines = [Int:Set<Int>]()
    private(set) var columns = [Int:Set<Int>]()
    private(set) var blocks = [Int:Set<Int>]()
    private(set) var leftDiagonal = Set<Int>()
    private(set) var rightDiagonal = Set<Int>()
    
    override init(expert:Bool) {
        super.init(expert:expert)
    }
    
    required init(from decoder: Decoder) throws {
        super.init(expert: false)
    }
    
    func prepareForSolving() {
        clear()
        for index in digits.indices {
            let coordinate = self[index]
            if lines[coordinate.column] == nil {
                lines[coordinate.column] = Set(arrayLiteral: digits[index])
            } else {
                lines[coordinate.column]!.insert(digits[index])
            }
            if columns[coordinate.row] == nil {
                columns[coordinate.row] = Set(arrayLiteral: digits[index])
            } else {
                columns[coordinate.row]!.insert(digits[index])
            }
            if blocks[coordinate.row/3 + 3*(coordinate.column/3)] == nil {
                blocks[coordinate.row/3 + 3*(coordinate.column/3)] = Set(arrayLiteral: digits[index])
            } else {
                blocks[coordinate.row/3 + 3*(coordinate.column/3)]!.insert(digits[index])
            }
        }
        if expert {
            leftDiagonal.insert(digits[0])
            rightDiagonal.insert(digits[8])
        }
 
    }
    
    @discardableResult
    func solve(_ row:Int = 0,_ column:Int = 0,_ start:Bool = false) -> Bool {
        let firstUnsolvedCell = unsolvableCell(0)
        return solverHelper(firstUnsolvedCell.row, firstUnsolvedCell.column, false)
    }
    
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
    
    private func isSaveAt(_ i:Int,_ j:Int,_ digit:Int) -> Bool {
        if lines[j]!.contains(digit) || columns[i]!.contains(digit) || blocks[i/3 + 3*(j/3)]!.contains(digit) || isLeftDiagonalSafe(i, j, digit) || isRightDiagonalSafe(i, j, digit)  {
            return false
         }
        return true
     }

    private func isLeftDiagonalSafe(_ i:Int,_ j:Int,_ digit:Int) -> Bool {
        if expert && i == j && leftDiagonal.contains(digit) {
            return true
        }
        return false
    }
    
    private func isRightDiagonalSafe(_ i:Int,_ j:Int,_ digit:Int) -> Bool {
        if expert && i + j == dimension - 1 && rightDiagonal.contains(digit) {
            return true
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
    
    
     private func updateData(insert:Bool,_ row:Int,_ column:Int, _ num:Int) {
        if insert {
            lines[column]!.insert(num)
            columns[row]!.insert(num)
            blocks[row/3+3*(column/3)]!.insert(num)
            if expert && row == column { leftDiagonal.insert(num)}
            if expert && row + column == dimension-1 { rightDiagonal.insert(num)}
        } else {
            lines[column]!.remove(num)
            columns[row]!.remove(num)
            blocks[row/3+3*(column/3)]!.remove(num)
            if expert && row == column { leftDiagonal.remove(num)}
            if expert && row + column == dimension-1 { rightDiagonal.remove(num)}
        }
    }
    
    private func clear() {
        lines.removeAll()
        columns.removeAll()
        blocks.removeAll()
        leftDiagonal.removeAll()
        rightDiagonal.removeAll()
    }
    
}



extension SudokuSolver: CustomStringConvertible {
    var description: String {
        var output = String()
        for index in digits.indices {
            output += "\(digits[index]) "
            if index%dimension.root == dimension.root - 1 {
                output += "|"
            }
            if index%dimension == dimension-1 {
                output += "\n"
            }
        }
        return output
    }
}

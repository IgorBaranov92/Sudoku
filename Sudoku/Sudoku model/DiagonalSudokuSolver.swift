import Foundation

class DiagonalSudokuSolver: SudokuSolver {
 
    private var leftDiagonal = Set<Int>()
    private var rightDiagonal = Set<Int>()

    override func prepareForSolving() {
        super.prepareForSolving()
        
    }
    
    override func updateData(insert: Bool, _ row: Int, _ column: Int, _ num: Int) {
        super.updateData(insert: insert, row, column, num)
        if insert {
            if  row == column { leftDiagonal.insert(num)}
            if row + column == dimension-1 { rightDiagonal.insert(num)}
        } else {
            if row == column { leftDiagonal.remove(num)}
            if row + column == dimension-1 { rightDiagonal.remove(num)}
        }
    }
    
    override func isSaveAt(_ i: Int, _ j: Int, _ digit: Int) -> Bool {
        if leftDiagonal.contains(digit) || rightDiagonal.contains(digit) {
            return false
        }
        return super.isSaveAt(i, j, digit)
    }

    private func isLeftDiagonalSafe(_ i:Int,_ j:Int,_ digit:Int) -> Bool {
        if i == j && leftDiagonal.contains(digit) {
            return true
        }
        return false
    }
    
    private func isRightDiagonalSafe(_ i:Int,_ j:Int,_ digit:Int) -> Bool {
        if  i + j == dimension - 1 && rightDiagonal.contains(digit) {
            return true
        }
        return false
    }
    
}

import Foundation

final class RombSudokuSolver: SudokuSolver {
    
    private(set) var leftDiagonal = Set(arrayLiteral: 5)
    private(set) var rightDiagonal = Set(arrayLiteral: 5)
    
    
    override func updateData(insert: Bool, _ row: Int, _ column: Int, _ num: Int) {
        if insert {
            if row + column == 4 || column - row == 4 { // left
                leftDiagonal.insert(num)
            }
            
            if row - column == 4 || row + column == 12 {
                rightDiagonal.insert(num)
            }
        } else {
            if row + column == 4 || column - row == 4 { // left
                 leftDiagonal.remove(num)
             }
            if row - column == 4 || row + column == 12 {
                rightDiagonal.remove(num)
            }
        }
        super.updateData(insert: insert, row, column, num)
    }
    
    override func isSaveAt(_ i: Int, _ j: Int, _ digit: Int) -> Bool {
//        if ( i + j == 4 || j - i == 4) { return !leftDiagonal.contains(digit)}
        if  (i - j == 4 || i + j == 12) { return !rightDiagonal.contains(digit)}
        return super.isSaveAt(i, j, digit)
    }
}

import XCTest
@testable import Судоку


class SudokuSolverTests: XCTestCase {
    
    var sudoku: SudokuGenerator!
    
    override func setUp() {
        sudoku = SudokuGenerator(difficult: 0, gameType: .classic, id: 0)
    }

    
    func testClassicBoard() {
        XCTAssert(SudokuSolver.getBaseGridBasedOn(.classic).count == 81, "error")
    }
    
    func testDiagonalBoard() {
        XCTAssert(SudokuSolver.getBaseGridBasedOn(.diagonal).count == 81, "error")
    }
    
    func testTwoDiagonalsBoard() {
        XCTAssert(SudokuSolver.getBaseGridBasedOn(.twoDiagonals).count == 81, "error")
    }
    
    func testRombBoard() {
        XCTAssert(SudokuSolver.getBaseGridBasedOn(.romb).count == 81, "error")
    }
    
    func testHexagonBoard() {
        XCTAssert(SudokuSolver.getBaseGridBasedOn(.hexagon).count == 81, "error")
    }

    func testDigits() {
        for i in 1...3000 {
            sudoku.clear()
            sudoku.generate()
            let digits = sudoku.digitsCount
            print("digits = \(digits) with \(i)")
            XCTAssert(digits[1] != nil)
            XCTAssert(digits[2] != nil)
            XCTAssert(digits[3] != nil)
            XCTAssert(digits[4] != nil)
            XCTAssert(digits[5] != nil)
            XCTAssert(digits[6] != nil)
            XCTAssert(digits[7] != nil)
            XCTAssert(digits[8] != nil)
            XCTAssert(digits[9] != nil)
            XCTAssert(sudoku.digits.count == 81)
            XCTAssert(sudoku.answers.count == 81)
        }
    }
    
    func testShapeBoard() {
        XCTAssert(ShapeSudokuSolver.getBaseGridBasedOn(0).count == 81, "error")
        XCTAssert(ShapeSudokuSolver.getBaseGridBasedOn(1).count == 81, "error")
        XCTAssert(ShapeSudokuSolver.getBaseGridBasedOn(2).count == 81, "error")
        XCTAssert(ShapeSudokuSolver.getBaseGridBasedOn(3).count == 81, "error")
        XCTAssert(ShapeSudokuSolver.getBaseGridBasedOn(4).count == 81, "error")
        XCTAssert(ShapeSudokuSolver.getBaseGridBasedOn(5).count == 81, "error")
        XCTAssert(ShapeSudokuSolver.getBaseGridBasedOn(6).count == 81, "error")
        XCTAssert(ShapeSudokuSolver.getBaseGridBasedOn(7).count == 81, "error")
        XCTAssert(ShapeSudokuSolver.getBaseGridBasedOn(8).count == 81, "error")
        XCTAssert(ShapeSudokuSolver.getBaseGridBasedOn(9).count == 81, "error")
        XCTAssert(ShapeSudokuSolver.getBaseGridBasedOn(10).count == 81, "error")
        XCTAssert(ShapeSudokuSolver.getBaseGridBasedOn(11).count == 81, "error")
    }
    
    func testSetCount() {
        XCTAssert(returnRightIndexesBasedOn(id: 0).count == 81)
        XCTAssert(returnRightIndexesBasedOn(id: 1).count == 81)
        XCTAssert(returnRightIndexesBasedOn(id: 2).count == 81)
        XCTAssert(returnRightIndexesBasedOn(id: 3).count == 81)
        XCTAssert(returnRightIndexesBasedOn(id: 4).count == 81)
        XCTAssert(returnRightIndexesBasedOn(id: 5).count == 81)
        XCTAssert(returnRightIndexesBasedOn(id: 6).count == 81)
        XCTAssert(returnRightIndexesBasedOn(id: 7).count == 81)
        XCTAssert(returnRightIndexesBasedOn(id: 8).count == 81)
        XCTAssert(returnRightIndexesBasedOn(id: 9).count == 81)
        XCTAssert(returnRightIndexesBasedOn(id: 10).count == 81)
        XCTAssert(returnRightIndexesBasedOn(id: 11).count == 81)
    }
    
    private func returnRightIndexesBasedOn(id:Int) -> Set<Int> {
        var set1 = Set<Int>()
        var set2 = Set<Int>()
        var set3 = Set<Int>()
        var set4 = Set<Int>()
        var set5 = Set<Int>()
        var set6 = Set<Int>()
        var set7 = Set<Int>()
        var set8 = Set<Int>()
        var set9 = Set<Int>()

        switch id {
        case 0:
        set1 = Set(arrayLiteral: 0,9,10,11,18,19,27,28,36)
        set2 = Set(arrayLiteral: 1,2,3,4,12,13,20,21,29)
        set3 = Set(arrayLiteral: 5,6,7,15,16,24,25,32,33)
        set4 = Set(arrayLiteral: 8,17,26,35,44,53,62,34,43)
        set5 = Set(arrayLiteral: 14,23,22,31,30,40,39,38,37)
        set6 = Set(arrayLiteral: 45,46,54,55,63,64,72,73,65)
        set7 = Set(arrayLiteral: 56,47,48,49,50,51,52,41,42)
        set8 = Set(arrayLiteral: 74,75,76,66,67,68,57,58,59)
        set9 = Set(arrayLiteral: 60,61,69,70,71,77,78,79,80)
        case 1:
         set1 = Set(arrayLiteral: 0,1,2,3,4,10,11,12,13)
         set2 = Set(arrayLiteral: 5,6,7,8,15,16,17,25,26)
         set3 = Set(arrayLiteral: 9,18,27,36,45,19,28,37,46)
         set4 = Set(arrayLiteral: 20,21,22,23,14,29,30,31,32)
         set5 = Set(arrayLiteral: 38,39,40,41,42,33,24,34,35)
         set6 = Set(arrayLiteral: 54,63,72,73,74,75,76,77,78)
         set7 = Set(arrayLiteral: 55,64,56,65,47,48,49,57,58)
         set8 = Set(arrayLiteral: 66,67,68,69,70,71,62,79,80)
         set9 = Set(arrayLiteral: 60,61,59,50,51,52,53,43,44)
        case 2:
         set1 = Set(arrayLiteral: 0,1,2,9,10,11,19,28,37)
         set2 = Set(arrayLiteral: 18,27,36,45,54,63,72,73,74)
         set3 = Set(arrayLiteral: 20,29,38,47,56,65,64,55,46)
         set4 = Set(arrayLiteral: 12,21,30,39,48,57,66,49,50)
         set5 = Set(arrayLiteral: 3,4,13,22,23,32,24,25,16)
         set6 = Set(arrayLiteral: 5,6,7,8,14,15,17,26,35)
         set7 = Set(arrayLiteral: 44,53,62,71,80,60,61,69,70)
         set8 = Set(arrayLiteral: 75,76,77,78,79,58,59,67,68)
         set9 = Set(arrayLiteral: 31,40,41,33,34,42,43,51,52)
        case 3:
         set1 = Set(arrayLiteral: 0,1,2,3,9,10,18,27,12)
         set2 = Set(arrayLiteral: 4,13,14,22,23,31,30,29,38)
         set3 = Set(arrayLiteral: 5,6,7,15,24,33,32,41,40)
         set4 = Set(arrayLiteral: 54,55,56,63,64,65,72,73,47)
         set5 = Set(arrayLiteral: 74,75,76,77,78,79,80,69,70)
         set6 = Set(arrayLiteral: 35,44,53,62,71,61,60,59,52)
         set7 = Set(arrayLiteral: 66,67,68,57,58,48,49,39,50)
         set8 = Set(arrayLiteral: 11,19,20,21,28,36,37,45,46)
         set9 = Set(arrayLiteral: 8,17,26,16,25,34,43,42,51)
        case 4:
         set1 = Set(arrayLiteral: 0,1,2,9,18,27,36,45,54)
         set2 = Set(arrayLiteral: 10,11,19,20,28,29,37,46,55)
         set3 = Set(arrayLiteral: 3,12,13,21,30,39,38,47,48)
         set4 = Set(arrayLiteral: 4,5,6,7,8,14,15,16,23)
         set5 = Set(arrayLiteral: 17,24,25,26,33,34,35,42,43)
         set6 = Set(arrayLiteral: 60,61,62,69,70,71,78,79,80)
         set7 = Set(arrayLiteral: 63,64,66,67,72,73,74,75,76)
         set8 = Set(arrayLiteral: 44,41,50,51,52,53,59,68,77)
         set9 = Set(arrayLiteral: 22,31,32,40,49,58,57,56,65)
        case 5:
         set1 = Set(arrayLiteral: 0,9,10,18,19,27,36,45,54)
         set2 = Set(arrayLiteral: 1,2,3,4,11,12,20,21,30)
         set3 = Set(arrayLiteral: 5,6,13,14,22,23,31,32,40)
         set4 = Set(arrayLiteral: 7,8,16,17,15,24,33,42,51)
         set5 = Set(arrayLiteral: 25,26,34,35,43,44,52,53,62)
         set6 = Set(arrayLiteral: 77,78,79,80,69,70,71,60,61)
         set7 = Set(arrayLiteral: 72,73,63,64,55,46,37,28,29)
         set8 = Set(arrayLiteral: 74,75,65,56,47,48,49,38,39)
         set9 = Set(arrayLiteral: 76,66,67,68,57,58,59,50,41)
        case 6:
         set1 = Set(arrayLiteral: 0,1,2,3,4,5,9,18,12)
         set2 = Set(arrayLiteral: 6,15,14,13,23,24,32,33,41)
         set3 = Set(arrayLiteral: 7,8,16,17,25,26,34,43,42)
         set4 = Set(arrayLiteral: 63,64,65,66,67,72,73,74,75)
         set5 = Set(arrayLiteral: 76,77,78,79,80,68,69,70,71)
         set6 = Set(arrayLiteral: 10,11,19,20,21,27,28,29,30)
         set7 = Set(arrayLiteral: 36,37,38,39,45,46,54,55,56)
         set8 = Set(arrayLiteral: 47,48,57,49,50,51,40,31,22)
         set9 = Set(arrayLiteral: 35,44,53,52,62,61,60,59,58)
        case 7:
         set1 = Set(arrayLiteral: 0,1,9,18,27,36,45,46,47)
         set2 = Set(arrayLiteral: 2,10,11,19,20,28,29,37,38)
         set3 = Set(arrayLiteral: 3,4,5,6,7,8,14,17,26)
         set4 = Set(arrayLiteral: 63,64,65,66,72,73,74,75,76)
         set5 = Set(arrayLiteral: 67,68,69,70,71,77,78,79,80)
         set6 = Set(arrayLiteral: 54,55,56,57,58,59,48,49,50)
         set7 = Set(arrayLiteral: 12,13,21,22,30,39,23,24,32)
         set8 = Set(arrayLiteral: 15,16,25,34,35,43,44,52,53)
         set9 = Set(arrayLiteral: 62,61,60,51,42,33,41,40,31)
        case 8:
         set1 = Set(arrayLiteral: 0,1,9,10,18,27,36,45,54)
         set2 = Set(arrayLiteral: 19,28,37,46,55,63,64,72,73)
         set3 = Set(arrayLiteral: 2,3,11,20,21,29,38,47,56)
         set4 = Set(arrayLiteral: 4,5,12,13,22,31,23,24,33)
         set5 = Set(arrayLiteral: 6,7,8,14,15,16,17,25,34)
         set6 = Set(arrayLiteral: 65,66,74,75,67,57,58,48,49)
         set7 = Set(arrayLiteral: 76,77,68,78,79,80,70,71,61)
         set8 = Set(arrayLiteral: 26,35,44,53,62,52,51,60,69)
         set9 = Set(arrayLiteral: 30,39,40,41,42,43,32,50,59)
        case 9:
         set1 = Set(arrayLiteral: 0,9,18,27,36,45,54,55,37)
         set2 = Set(arrayLiteral: 1,2,10,19,28,29,38,47,46)
         set3 = Set(arrayLiteral: 3,11,12,20,21,30,39,48,57)
         set4 = Set(arrayLiteral: 4,5,6,7,8,16,17,26,35)
         set5 = Set(arrayLiteral: 63,64,65,66,56,72,73,74,75)
         set6 = Set(arrayLiteral: 67,68,69,70,76,77,78,79,80)
         set7 = Set(arrayLiteral: 71,62,61,60,59,58,51,52,53)
         set8 = Set(arrayLiteral: 13,14,22,23,31,32,33,40,49)
         set9 = Set(arrayLiteral: 15,24,25,34,41,42,43,44,50)
        case 10:
         set1 = Set(arrayLiteral: 0,1,2,3,9,10,11,19,20)
         set2 = Set(arrayLiteral: 4,5,12,13,14,21,22,31,40)
         set3 = Set(arrayLiteral: 6,15,16,24,33,42,51,60,69)
         set4 = Set(arrayLiteral: 7,8,17,25,26,34,35,43,44)
         set5 = Set(arrayLiteral: 52,53,61,62,70,71,79,80,78)
         set6 = Set(arrayLiteral: 36,37,45,46,54,55,63,72,73)
         set7 = Set(arrayLiteral: 18,27,28,29,30,38,39,47,48)
         set8 = Set(arrayLiteral: 75,76,77,68,59,50,41,32,23)
         set9 = Set(arrayLiteral: 74,64,65,66,67,56,57,58,49)
        case 11:
         set1 = Set(arrayLiteral: 0,9,18,27,36,37,45,46,54)
         set2 = Set(arrayLiteral: 1,2,3,4,10,19,28,12,21)
         set3 = Set(arrayLiteral: 5,6,7,8,16,14,23,32,41)
         set4 = Set(arrayLiteral: 72,73,74,75,76,77,63,64,55)
         set5 = Set(arrayLiteral: 78,79,80,69,66,67,68,57,59)
         set6 = Set(arrayLiteral: 15,17,24,25,26,33,34,42,43)
         set7 = Set(arrayLiteral: 13,22,31,40,49,58,48,50,51)
         set8 = Set(arrayLiteral: 11,20,29,30,38,39,47,56,65)
         set9 = Set(arrayLiteral: 35,44,52,53,60,61,62,70,71)
            
        default:break
        }
    let superSet = set1.union(set2).union(set3).union(set4).union(set5).union(set6).union(set7).union(set8).union(set9)

        return superSet
    }
}


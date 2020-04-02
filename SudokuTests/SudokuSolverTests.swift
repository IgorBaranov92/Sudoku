import XCTest
@testable import Sudoku


class SudokuSolverTests: XCTestCase {
    
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
    
    func testTwoRombsBoard() {
        XCTAssert(SudokuSolver.getBaseGridBasedOn(.twoRombs).count == 81, "error")
    }
    
}

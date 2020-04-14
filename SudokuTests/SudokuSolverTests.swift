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
    
}

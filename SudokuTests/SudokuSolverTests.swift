import XCTest
@testable import Sudoku

var solver:SudokuSolver!

class SudokuSolverTests: XCTestCase {

    override class func setUp() {
        super.setUp()
        solver = SudokuSolver()
        solver.digits = [1,2,3,4,5,6,7,8,9].shuffled() + Array(repeating: 0, count: 72)
        solver.prepareForSolving()
        solver.solve()

    }
    

    func testDigitsCount() {
        XCTAssertEqual(solver.digits.count, solver.dimension.square)
    }
    
    
    func testValidLines() {
        for line in 0...8 {
            XCTAssertTrue(solver.lines[line] != nil)
        }
    }
    
    func testValidColumns() {
        for column in 0...8 {
            XCTAssertTrue(solver.columns[column] != nil)
        }
    }
    
    func testValidBlocks() {
        for block in 0...8 {
            XCTAssertTrue(solver.blocks[block] != nil)
        }
    }
    
    func testSolving() {
        measure {
            solver.solve()
        }
    }
    
    func testExpertSolving() {
        measure {
        }
    }
    
    func testPerformanceForHardest() {
        let hardest = SudokuSolver()
        hardest.digits = "800000000003600000070090200050007000000045700000100030001000068008500010090000400".map{ Int(String($0))!}
        hardest.prepareForSolving()
        measure {
            hardest.solve()
        }
    }
    
}

import Foundation


struct Indexes {
    
    static func getIndexesBasedOn(_ gameType:GameType,index:Int) -> (first:Set<Int>,second:Set<Int>) {
        var firstIndexes = Set<Int>()
        var secondIndexes = Set<Int>()
        let coordinates = Sudoku[index]
        switch gameType {
        case .diagonal:
            if coordinates.row == coordinates.column {//left
                firstIndexes.formUnion([0,10,20,30,40,50,60,70,80])
            }
            if coordinates.row + coordinates.column == 8 { //right
                secondIndexes.formUnion([8,16,24,32,40,48,56,64,72])
            }
        case .twoDiagonals:
            if coordinates.row - coordinates.column == 1 { //upper left
                firstIndexes.formUnion([9,19,29,39,49,59,69,79])
            }
            if coordinates.column - coordinates.row == 1 { //lower left
                firstIndexes.formUnion([1,11,21,31,41,51,61,71])
            }
            if coordinates.row + coordinates.column == 7 { //upper right
                secondIndexes.formUnion([63,55,47,39,31,23,15,7])
            }
            if coordinates.row + coordinates.column == 9 { //lower right
                secondIndexes.formUnion([73,65,57,49,41,33,25,17])
            }
        case .romb:
            if (coordinates.row + coordinates.column) == 4 || (coordinates.row - coordinates.column) == 4 { //left
                firstIndexes.formUnion([4,12,20,28,36,46,56,66,76])
            }
            if coordinates.column - coordinates.row == 4 || coordinates.row + coordinates.column == 12 { // right
                secondIndexes.formUnion([4,14,24,34,44,52,60,68,76])
            }
        default:break
        }
        return (firstIndexes,secondIndexes)
    }
    
    
    static func lineIndexesAt(_ index:Int) -> Set<Int> {
        let coordinates = Sudoku[index]
        var indexes = Set<Int>()
        for column in 0...8 {
                indexes.insert(Sudoku[coordinates.row,column])
        }
        return indexes
    }
    
    
    static func columnIndexesAt(_ index:Int) -> Set<Int> {
        let coordinates = Sudoku[index]
        var indexes = Set<Int>()
        for row in 0...8 {
            indexes.insert(Sudoku[row,coordinates.column])
        }
        return indexes
    }
    
    static func blockIndexesAt(_ index:Int,gameType:GameType,id:Int) -> Set<Int> {
        let coordinates = Sudoku[index]
        var indexes = Set<Int>()
        let rowOffset = coordinates.column - coordinates.column%3
        let columnOffset = coordinates.row - coordinates.row%3
        if gameType != .shape {
            for i in 0...8 {
                indexes.insert(columnOffset*9 + rowOffset + i/3*9 + i%3)
            }
        } else {
            indexes = ShapeSudoku.returnRightIndexesBasedOn(index,id:id)
        }
        return indexes
    }
    
}

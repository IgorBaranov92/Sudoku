import Foundation


struct Indexes {
    
    static func getIndexesBasedOn(_ gameType:GameType,index:Int) -> (first:[Int],second:[Int]) {
        var firstIndexes = [Int]()
        var secondIndexes = [Int]()
        let coordinates = Sudoku[index]
        switch gameType {
        case .diagonal:
            if coordinates.row == coordinates.column {//left
                firstIndexes += [0,10,20,30,40,50,60,70,80]
            }
            if coordinates.row + coordinates.column == 8 { //right
                secondIndexes += [8,16,24,32,40,48,56,64,72]
            }
        case .twoDiagonals:
            if coordinates.row - coordinates.column == 1 { //upper left
                firstIndexes += [9,19,29,39,49,59,69,79]
            }
            if coordinates.column - coordinates.row == 1 { //lower left
                firstIndexes += [1,11,21,31,41,51,61,71]
            }
            if coordinates.row + coordinates.column == 7 { //upper right
                secondIndexes += [63,55,47,39,31,23,15,7]
            }
            if coordinates.row + coordinates.column == 9 { //lower right
                secondIndexes += [73,65,57,49,41,33,25,17]
            }
        case .romb:
            if (coordinates.row + coordinates.column) == 4 || (coordinates.row - coordinates.column) == 4 { //left
                firstIndexes += [4,12,20,28,36,46,56,66,76]
            }
            if coordinates.column - coordinates.row == 4 || coordinates.row + coordinates.column == 12 { // right
                secondIndexes += [4,14,24,34,44,52,60,68,76]
            }
        case .shape :
            firstIndexes += ShapeSudoku.returnRightIndexesBasedOn(index)
        default:break
        }
        return (firstIndexes,secondIndexes)
    }
    
}

import Foundation

class Sudoku: Codable {
    
    let dimension = 9
    var digits = [Int]()
    var answers = [Int]()
   

    //how many cells delete
    enum Difficult: Int, Codable {
        case easy = 42
        case medium = 48
        case hard = 55
    }

    
    subscript(_ i:Int,_ j:Int) -> Int {
       set {
           digits[i*dimension+j] = newValue
       } get {
           return digits[i*dimension+j]
       }
   }
   
    static subscript(_ i:Int,_ j:Int) -> Int {
        return i*9+j
    }
    
    subscript(_ index:Int) -> (row:Int,column:Int) {
       return (index/dimension,index%dimension)
   }
    
    static subscript(_ index:Int) -> (row:Int,column:Int) {
        return (index/9,index%9)
    }
    
    
}




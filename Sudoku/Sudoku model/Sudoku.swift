import Foundation

class Sudoku: Codable {
    
    let dimension = 9
    var digits = [Int]()
    var answers = [Int]()
   

    //how many cells delete
    enum Difficult: Int, Codable {
        case easy = 42
        case medium = 48
        case hard = 52
    }

    
    subscript(_ i:Int,_ j:Int) -> Int {
       set {
           digits[j*dimension+i] = newValue
       } get {
           return digits[j*dimension+i]
       }
   }
   
    subscript(_ index:Int) -> (row:Int,column:Int) {
       return (index%dimension,index/dimension)
   }
          
    
    
}




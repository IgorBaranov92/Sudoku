import Foundation

final class ShapeSudoku {
    
    static func returnRightIndexesBasedOn(_ index:Int,id:Int) -> Set<Int> {
        var output = Set<Int>()
        let set1 = Set(arrayLiteral: 0,9,10,11,18,19,27,28,36)
        let set2 = Set(arrayLiteral: 1,2,3,4,12,13,20,21,29)
        let set3 = Set(arrayLiteral: 5,6,7,15,16,24,25,32,33)
        let set4 = Set(arrayLiteral: 8,17,26,35,44,53,62,34,43)
        let set5 = Set(arrayLiteral: 14,23,22,31,30,40,39,38,37)
        let set6 = Set(arrayLiteral: 45,46,54,55,63,64,72,73,65)
        let set7 = Set(arrayLiteral: 56,47,48,49,50,51,52,41,42)
        let set8 = Set(arrayLiteral: 74,75,76,66,67,68,57,58,59)
        let set9 = Set(arrayLiteral: 60,61,69,70,71,77,78,79,80)
        let sets = [set1,set2,set3,set4,set5,set6,set7,set8,set9]
        for set in sets {
            if set.contains(index) {
                output = set
            }
        }
        return output
    }
    
}

import Foundation

extension Array where Element:Hashable {
    func unique() -> [Element] {
        return Array(Set(self))
    }
}

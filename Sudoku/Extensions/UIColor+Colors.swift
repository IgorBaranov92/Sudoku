import Foundation
import UIKit

extension UIColor {
    
    
    static var diagonal: UIColor {
        return UIColor(named: "DynamicDiagonalColor") ?? .gray
    }
    
    static var border: UIColor {
        return UIColor(named: "DynamicBorderColor") ?? .black
    }
    
    static var text: UIColor {
        return UIColor(named: "DynamicTextColor") ?? .black
    }
    

    
}

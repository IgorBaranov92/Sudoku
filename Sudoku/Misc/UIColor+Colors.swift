import Foundation
import UIKit

extension UIColor {
    
    static var selection: UIColor {
        return UIColor(named: "DynamicSelectionColor") ?? .green
    }
    
    static var highlight: UIColor {
        return UIColor(named: "DynamicHighlightColor") ?? .green
    }
    
    static var diagonal: UIColor {
        return UIColor(named: "DynamicDiagonalColor") ?? .gray
    }
    
    static var border: UIColor {
        return UIColor(named: "DynamicBorderColor") ?? .black
    }
    
    static var button: UIColor {
        return UIColor(named: "DynamicBlackColor") ?? .black
    }
    
    static var text: UIColor {
        return UIColor(named: "DynamicTextColor") ?? .black
    }
    
    static var dynamicGreen: UIColor {
        return UIColor(named:"DynamicGreenColor") ?? .green
    }
    
}

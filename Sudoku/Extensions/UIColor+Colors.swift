import Foundation
import UIKit

extension UIColor {
    
    static var dynamicBlack: UIColor {
        return UIColor(named: "BlackColor") ?? .black
    }
    
    static var dynamicGreen: UIColor {
        return UIColor(named: "GreenColor") ?? #colorLiteral(red: 0.1879999936, green: 0.8199999928, blue: 0.3449999988, alpha: 1)
    }
    
    static var dynamicBlue: UIColor {
        return UIColor(named: "BlueColor") ?? .blue
    }
    
    static var dynamicRed: UIColor {
        return UIColor(named:"RedColor") ?? .red
    }
    
    static var dynamicOrange: UIColor {
        return UIColor(named:"OrangeColor") ?? .orange
    }
    
    static var background: UIColor {
        return UIColor(named: "BackgroundColor") ?? .white
    }
    
    static var backgroundInactive: UIColor {
        return UIColor(named: "BackgroundInactive") ?? .gray
    }
    
    static var diagonal: UIColor {
        return UIColor(named: "DiagonalColor") ?? .gray
    }
        
    static var selection: UIColor {
        return UIColor(named: "SelectionColor") ?? .green
    }
    
    static var highlight: UIColor {
        return UIColor(named: "HighlightColor") ?? .green
    }
    
}

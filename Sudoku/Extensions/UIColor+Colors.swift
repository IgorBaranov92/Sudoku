import Foundation
import UIKit

extension UIColor {
    
    static var dynamicBlack: UIColor {
        return UIColor(named: "BlackColor") ?? .black
    }
    
    static var dynamicGreen: UIColor {
        return UIColor(named: "GreenColor") ?? .green
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

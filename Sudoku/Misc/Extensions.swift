import Foundation
import UIKit

extension CALayer {
    func addLineAt(edge:UIRectEdge,width:CGFloat) {
        let subLayer = CALayer()
        switch edge {
        case .top:
            subLayer.frame = CGRect(x: 0, y: 0, width: frame.width, height: width)
        case .right:
            subLayer.frame = CGRect(x: frame.width - width, y: 0, width: width, height: frame.height)
        case .left:
            subLayer.frame = CGRect(x: 0, y: 0, width: width, height: frame.height)
        case .bottom:
            subLayer.frame = CGRect(x: 0, y: frame.height-width, width: frame.width, height: width)
        default:break
        }
        subLayer.name = "border"
        if #available(iOS 13.0, *) {
            subLayer.backgroundColor = Colors.dynamicBorderColor.cgColor
        } else {
            subLayer.backgroundColor = UIColor.black.cgColor
        }
        addSublayer(subLayer)
    }
    
    func addDiagonalAt(edge:UIRectEdge,width:CGFloat) {
        let subLayer = CAShapeLayer()
        let path = UIBezierPath()
        switch edge {
        case .top:
            path.move(to: CGPoint(x: 0, y: 0))
            path.addLine(to: CGPoint(x: frame.width, y: frame.height))
        case .bottom:
            path.move(to: CGPoint(x: 0, y: frame.height))
            path.addLine(to: CGPoint(x: frame.width, y: 0))
        default:break
        }
        path.lineWidth = width
        UIColor.black.setStroke()
        path.stroke()
        subLayer.path = path.cgPath
        if #available(iOS 13.0, *) {
            subLayer.strokeColor =  Colors.dynamicDiagonalColor.cgColor
        } else {
            subLayer.strokeColor =  #colorLiteral(red: 0.7737190911, green: 0.7737190911, blue: 0.7737190911, alpha: 1).cgColor
        }
        subLayer.name = "diagonal"
        insertSublayer(subLayer, at: 0)
    }
}

extension UIDevice {
    static var isIpad: Bool { UIDevice.current.userInterfaceIdiom == .pad }
    
    static var isLandscape: Bool { UIDevice.current.orientation == .landscapeLeft || UIDevice.current.orientation == .landscapeRight  }
    
     enum deviceType {
        case iPhoneX
        case iPhoneXr
        case iPhone8Plus
        case iPhone7
        case iPhoneSE
        case ipad
        case ipadPro9
        case ipadPro11
        case iPadPro12
        case unknown
    }
    static var device: deviceType {
        switch UIScreen.main.nativeBounds.width {
        case 1620: return .ipad
        case 1536: return .ipadPro9
        case 1668: return .ipadPro11
        case 2048: return .iPadPro12
        case 1242: return .iPhone8Plus
        case 1125: return .iPhoneX
        case 828: return .iPhoneXr
        case 750: return .iPhone7
        case 640: return .iPhoneSE
        default:return .unknown
        }
    }
    
}

extension Array where Element:Hashable {
    func unique() -> [Element] {
        return Array(Set(self))
    }
}

extension UIView {
    func removeLayer(layerName: String) {
            for item in self.layer.sublayers ?? [] where item.name == layerName {
                    item.removeFromSuperlayer()
            }
        }
}

extension Int {
    var square: Int { self*self}
    var root : Int { return Int(sqrt(Double(self)))}
}


protocol SudokuDelegate: class {
    func gameLost()
    func gameWon()
}

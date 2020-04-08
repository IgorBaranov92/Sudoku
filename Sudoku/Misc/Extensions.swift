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
        subLayer.backgroundColor = UIColor.border.cgColor
        addSublayer(subLayer)
    }
    
    func addDiagonalAt(edge:LayerType,width:CGFloat) {
        let subLayer = CAShapeLayer()
        let path = CGMutablePath()
        let upperLeft = CGPoint.zero
        let upperRight = CGPoint(x: frame.width, y: 0)
        let lowerLeft = CGPoint(x: 0, y: frame.height)
        let lowerRight = CGPoint(x: frame.width, y: frame.height)
        let center = CGPoint(x: frame.width/2, y: frame.height/2)
        switch edge {
        case .leftDiagonal:
            path.move(to: upperLeft)
            path.addLine(to: lowerRight)
        case .rightDiagonal:
            path.move(to: lowerLeft)
            path.addLine(to: upperRight)
        case .leftAngle:
            path.move(to: lowerRight)
            path.addLine(to: center)
            let p1 = CGMutablePath()
            p1.move(to: center)
            p1.addLine(to: upperRight)
            path.addPath(p1)
        case .rightAngle:
            path.move(to: lowerLeft)
            path.addLine(to: center)
            let p1 = CGMutablePath()
            p1.move(to: center)
            p1.addLine(to: upperLeft)
            path.addPath(p1)
        case .topAngle:
            path.move(to: lowerLeft)
            path.addLine(to: center)
            let p1 = CGMutablePath()
            p1.move(to: center)
            p1.addLine(to: lowerRight)
            path.addPath(p1)
        case .bottomAngle:
            path.move(to: upperLeft)
            path.addLine(to: center)
            let p1 = CGMutablePath()
            p1.move(to: center)
            p1.addLine(to: upperRight)
            path.addPath(p1)
        }
        
        subLayer.path = path
        subLayer.strokeColor = UIColor.diagonal.cgColor
        subLayer.name = edge.rawValue
        insertSublayer(subLayer, at: 0)
    }
    
    enum LayerType:String {
        case leftDiagonal
        case rightDiagonal
        case leftAngle
        case rightAngle
        case topAngle
        case bottomAngle
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

extension Double {
    var cg: CGFloat { return CGFloat(self)}
}

extension CGRect {
    var center:CGPoint {
        CGPoint(x: midX, y: midY)
    }
}


protocol SudokuDelegate: class {
    func gameLost()
    func gameWon()
    func animateRowWith(_ indexes:[Int])
    func animateLineWith(_ indexes:[Int])
    func animateBlockWith(_ indexes:[Int])
}

protocol EraseViewDelegate: class {
    func eraseConfirmed()
    func eraseCanceled()
}


func localized(_ key:String) -> String {
    return NSLocalizedString(key, comment: " ")
}

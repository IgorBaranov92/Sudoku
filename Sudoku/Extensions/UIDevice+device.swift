import UIKit

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

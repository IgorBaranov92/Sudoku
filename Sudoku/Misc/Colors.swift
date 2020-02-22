import UIKit

@available(iOS 13.0, *)
class Colors {
    static var dynamicBackgroundColor = UIColor { (traitCollection:UITraitCollection) -> UIColor in
        if traitCollection.userInterfaceStyle == .dark {
            return #colorLiteral(red: 0.1122483738, green: 0.1215337673, blue: 0.1350231375, alpha: 1)
        } else {
            return .white
        }
    }
    static var dynamicTextColor = UIColor { (traitCollection:UITraitCollection) -> UIColor in
        if traitCollection.userInterfaceStyle == .dark {
            return #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        } else {
            return .black
        }
    }

    static var dynamicButtonColor = UIColor { (traitCollection:UITraitCollection) -> UIColor in
        if traitCollection.userInterfaceStyle == .dark {
            return #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
        } else {
            return UIColor.systemGreen
        }
    }
    
    
    static var dynamicSelectionColor = UIColor { (traitCollection:UITraitCollection) -> UIColor in
        traitCollection.userInterfaceStyle == .dark ?  #colorLiteral(red: 0.1936248368, green: 0.1936248368, blue: 0.1936248368, alpha: 0.8704783818) :  #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
    }
    
    static var dynamicHighlightColor = UIColor { (traitCollection:UITraitCollection) -> UIColor in
        return traitCollection.userInterfaceStyle == .dark ? #colorLiteral(red: 0.3441641769, green: 0.3441641769, blue: 0.3441641769, alpha: 1) :  #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
    }
    
    static var dynamicBorderColor = UIColor { (traitCollection:UITraitCollection) -> UIColor in
        return traitCollection.userInterfaceStyle == .dark ?  #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1) :  .black
    }
    
    static var dynamicDiagonalColor = UIColor { (traitCollection:UITraitCollection) -> UIColor in
        return traitCollection.userInterfaceStyle == .dark ?  #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1) :   #colorLiteral(red: 0.7737190911, green: 0.7737190911, blue: 0.7737190911, alpha: 1)
    }
    
}

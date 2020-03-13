import UIKit

@IBDesignable
class BorderedCell: UIButton {

    let lineWidth: CGFloat = UIDevice.isIpad ? 4 : 2

    @IBInspectable
    var line1:Int = 0 { didSet { setNeedsDisplay() }}
    
    @IBInspectable
    var line2:Int = 0 { didSet { setNeedsDisplay() }}
        

    
    override func draw(_ rect: CGRect) {
        removeLayer(layerName: "border")
        switch line1 {
        case 1: layer.addLineAt(edge: .top, width: lineWidth)
        case 2: layer.addLineAt(edge: .right, width: lineWidth)
        case 3: layer.addLineAt(edge: .left, width: lineWidth)
        case 4: layer.addLineAt(edge: .bottom, width: lineWidth)
        default:break
        }
        switch line2 {
        case 1: layer.addLineAt(edge: .top, width: lineWidth)
        case 2: layer.addLineAt(edge: .right, width: lineWidth)
        case 3: layer.addLineAt(edge: .left, width: lineWidth)
        case 4: layer.addLineAt(edge: .bottom, width: lineWidth)
        default:break
        }
     
    }


}




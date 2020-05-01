import UIKit

@IBDesignable
class Hexagon: UIView {

    override func draw(_ rect: CGRect) {
        removeLayer(layerName: "hexagon")
        layer.addHexagonAt(frame, lineWidth: 1)
    }

    
}

import UIKit

class ScrollView: UIScrollView, UIScrollViewDelegate {

    private var stackView: UIStackView?
    
    override func draw(_ rect: CGRect) {
        
        
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print(scrollView.contentOffset.x)
        print(scrollView.contentSize)
        if scrollView.contentOffset.x <= 0 {
            scrollView.setContentOffset(CGPoint.zero, animated: false)
        }
        
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }

    
    private func setup() {
        delegate = self
        if let stackView = self.subviews[0] as? UIStackView {
            self.stackView = stackView
        }
    }
}

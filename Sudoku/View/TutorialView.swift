import UIKit

class TutorialView: MessageView {

    var message = " " { didSet { setNeedsDisplay() }}
    
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        let label = UILabel(frame: CGRect(origin: CGPoint(x: 10, y: 10), size: CGSize(width: rect.width - 10, height: rect.height/10 - 10)))
        label.textAlignment = .center
        label.text = localized("rules")
        label.textColor = .systemGreen
        label.font = UIFont(name: "Avenir Next", size: 35)
        addSubview(label)
        
        let textView = UITextView(frame: CGRect(x: 10, y: rect.height/10, width: rect.width - 20, height: rect.height*4/5 - 15))
        textView.text = "French newspapers featured variations of the Sudoku puzzles in the 19th century, and the puzzle has appeared since 1979 in puzzle books under the name Number Place.[5] However, the modern Sudoku only began to gain widespread popularity in 1986 when it was published by the Japanese puzzle company Nikoli under the name Sudoku, meaning.[6] It first appeared in a U.S. newspaper, and then The Times (London), in 2004, thanks to the efforts of Wayne Gould, who devised a computer program to rapidly produce unique puzzles."
        textView.backgroundColor = .clear
        textView.font = UIFont(name: "Avenir Next", size: 20)
        textView.isEditable = false
        textView.allowsEditingTextAttributes = false
        textView.isSelectable = false
        addSubview(textView)
        
        let done = DoneButton(type: .custom)
        done.frame = CGRect(x: 10, y: rect.height*9/10 - 15, width: rect.width - 20, height: rect.height/10)
        done.addTarget(self, action: #selector(dismissSelf), for: .touchUpInside)
        addSubview(done)
    }
    
    
    @objc
    private func dismissSelf() {
        TutorialViewAnimator.dismiss(self)
    }
    

}

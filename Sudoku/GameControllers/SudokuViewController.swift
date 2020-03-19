import UIKit

class SudokuViewController: GameViewController, SudokuDelegate, MessageViewDelegate {
    
    // MARK: - Public API
    
    lazy var sudoku = SudokuGenerator(difficult: 0,delegate: self)
    var selectedButton: Cell? { cells.filter { $0.active == true }.first}
    var game = Game()
    
    // MARK: - Outlets
    
    @IBOutlet var cells: [Cell]! { didSet {
        cells.forEach {
            $0.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(touchField)))
        }}}
    
    @IBOutlet var digits: [UIButton]!
    @IBOutlet weak var mistakesLabel: UILabel!
    @IBOutlet weak var hintsLabel: UILabel!
    
    // MARK: - private vars
    
    private var hasActiveButton: Bool?
    
    
    // MARK: - ViewController lifecycle
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(clear)))
        NotificationCenter.default.addObserver(self, selector: #selector(saveGame), name: UIApplication.willResignActiveNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(updateBoard), name: UIApplication.willEnterForegroundNotification, object: nil)
        recreateGameIfNeeded()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    //    showRules()
    }

    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
//        cells[0].backgroundColor = .red
//        CellAnimator.show(cells[0])

    }
    
    // MARK: - IBActions
    
    
    @IBAction func erase(_ sender: UIButton) {
        hasActiveButton = nil
        guard let button = selectedButton else { return }
        guard let buttonIndex = cells.firstIndex(of: button) else { return }
        guard let title = button.currentTitle else { return }
        let center = button.convert(button.bounds.center, to: stackView)
        let pivot = stackView.convert(center, to: view)
        guard let digit = Int(title) else {
            showErrorAt(pivot, message: localized("ErrorEmpty"))
            return
        }
        if sudoku.mistakesMade.contains(buttonIndex) {// erase only mistakes
            eraseDigit(digit, at: buttonIndex)
            cells[buttonIndex].setTitleColor(.text, for: .normal)

        } else {
            showErrorAt(pivot, message: localized("ErrorNative"))
        }
    }
    
    
    @IBAction func digitTouched(_ sender: UIButton) {
        guard let title = sender.currentTitle else { return }
        guard let digit = Int(title) else { return }
        guard hasActiveButton != nil else {
            reset(full:false)
            sudoku.highlightAllButtonsBasedOn(digit: digit).related.forEach { cells[$0].highlight = true }
            sudoku.highlightAllButtonsBasedOn(digit: digit).active.forEach { cells[$0].hinted = true }
            return
        }
        hasActiveButton = nil
        guard let selectedButton = selectedButton else { return }
        guard let index = cells.firstIndex(of: selectedButton) else { return }
        if selectedButton.currentTitle == "" {
            sudoku.cellTouchedAt(index: index, digit: digit)
            saveGame()
            hideDigitIfPossible()
            selectedButton.setTitle(title, for: .normal)
            if digit == sudoku.answers[index] { //right digit
                selectedButton.setTitleColor(.text, for: .normal)
            } else { //mistake
                selectedButton.setTitleColor(.orange, for: .normal)
                updateLabels()
            }
        } else {
            let center = selectedButton.convert(selectedButton.bounds.center, to: stackView)
            let pivot = stackView.convert(center, to: view)
            showErrorAt(pivot, message: localized("ErrorFilled"))
        }
    }
    
     
    @IBAction func showHint(_ sender:UIButton){
        guard let selectedButton = selectedButton else { return }
        guard let index = cells.firstIndex(of: selectedButton) else { return }
        if sudoku.digits[index] != 0 { //cell is solved already
            let center = selectedButton.convert(selectedButton.bounds.center, to: stackView)
            let pivot = stackView.convert(center, to: view)
            showErrorAt(pivot, message: localized("ErrorFilled"))
        } else { // empty cell, please hint me
            sudoku.hint(index: index)
            updateBoard()
            updateLabels()
            hideDigitIfPossible()
            hasActiveButton = nil
            saveGame()
        }
        
    }
    
    
    @objc
    private func touchField(_ recognizer: UITapGestureRecognizer) {
        if recognizer.state == .ended {
            if let button = recognizer.view as? Cell,
                let index = cells.firstIndex(of: button) {
                reset(full:false)
                cells[index].active = true
                sudoku.highlightButtons(index).forEach { cells[$0].highlight = true }
                hasActiveButton = true
            }
        }
    }

    
    // MARK: - Updating UI
    
    private func updateUI() {
        updateBoard()
        updateLabels()
        hideDigitIfPossible()
    }
    
    @objc
    private func updateBoard() {
        cells?.forEach { $0.setTitle("", for: .normal) }
        for index in sudoku.digits.indices {
            if sudoku.digits[index] != 0 {
                cells[index].setTitle("\(sudoku.digits[index])", for: .normal)
            }
            if #available(iOS 13, *) {
                cells[index].setTitleColor(sudoku.mistakesMade.contains(index) ? .orange : .text, for: .normal)

            } else {
                cells[index].setTitleColor(sudoku.mistakesMade.contains(index) ? .orange : .black, for: .normal)
            }
        }
    }
    
    private func updateLabels() {
        mistakesLabel.text = "\(localized("mistakes")): \(sudoku.mistakesMade.count)/\(sudoku.mistakes)"
        hintsLabel.text = "\(localized("hints")): \(sudoku.hintsMade)/\(sudoku.hints)"
    }
    
    private func hideDigitIfPossible() {
        for digit in 1...9 {
            digits[digit-1].isHidden = sudoku.digitsCount[digit] == 9 ? true : false
        }
    }
    
    @objc private func clear() { reset(full: false) }
    
    @objc
    private func reset(full:Bool) {
        cells.forEach {
            $0.active = false
            $0.highlight = false
            $0.hinted = false
            if full {
                $0.setTitle("", for: .normal)
                $0.setTitleColor(.text, for: .normal)
            }
        }
    }
    
    
    private func eraseDigit(_ digit:Int,at index:Int) {
        sudoku.eraseAt(index, digit)
        cells[index].setTitle("", for: .normal)
        hideDigitIfPossible()
        saveGame()
    }
    
    
    // MARK: - Gamedelegate

    func gameWon() {
        let victory = FinishGameView()
        victory.delegate = self
        view.addSubview(victory)
        TutorialViewConstraint.activate(victory, self.view)
        TutorialViewAnimator.show(victory)
    }
    
    func gameLost() {
        let alert = UIAlertController(title: "Message", message: "Game lose", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "New game", style: .default, handler: { action in
            self.newGame()
        }))
        present(alert, animated: true)
    }
    
    func animateRowWith(_ indexes: [Int]) {
//        indexes.forEach {
//            let cell = cells[$0]
//        }
    }
    
    func animateLineWith(_ indexes: [Int]) {
//        indexes.forEach {
//            let cell = cells[$0]
//        }
    }
    
    func animateBlockWith(_ indexes: [Int]) {
//        indexes.forEach {
//            let cell = cells[$0]
//        }
    }
 
    // MARK: - Restoring and saving games
       
    private func recreateGameIfNeeded() {
        if let url = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true).appendingPathComponent("games"),let data = try? Data(contentsOf: url),let newValue = Game(json: data) {
            game = newValue
            guard let game = game.games[0] else { newGame();return  }
            sudoku = game
            sudoku.delegate = self
            updateUI()
            saveGame()
        } else {
            newGame()
        }
    }
    
    
    @objc private func saveGame() {
        if let url = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true).appendingPathComponent("games"),let json = game.json {
            try? json.write(to: url)
        }
    }
    
    private func newGame() {
        reset(full: true)
        digits.forEach { $0.isHidden = false }
        hasActiveButton = nil
        view.isUserInteractionEnabled = true
        sudoku = SudokuGenerator(difficult: 0,delegate: self) { // game created
                                        DispatchQueue.main.async { [weak self] in
                                            self?.saveGame()
                                            self?.updateUI()
            }}

    }
    
    @IBAction func back(_ sender:UIButton) {
        dismiss(animated: true)
    }
    
    @IBAction func showRules(_ sender: UIButton) {
        showRules()
    }
    
    private func showErrorAt(_ pivot:CGPoint,message:String) {
        let rect = rightFrameBasedOn(pivot)
        let errorView = ErrorView(frame: rect)
        errorView.message = message
        errorView.pivot = pivot
        view.addSubview(errorView)
    }
    
    
    private func rightFrameBasedOn(_ center: CGPoint) -> CGRect {
        guard let button = selectedButton else { return CGRect.zero}
        return CGRect(x: 0, y: center.y - button.bounds.height*1.5, width: view.bounds.width, height: button.bounds.height)
    }
  
    private func showRules() {
        let tutorialView = TutorialView()
        tutorialView.message = localized("classicMessage")
        view.addSubview(tutorialView)
        TutorialViewConstraint.activate(tutorialView, self.view)
        TutorialViewAnimator.show(tutorialView)
    }
    
    // MARK: - Protocol conformance
    
    func cancelButtonTouched() {
        //save game progress
        dismiss(animated: true)
    }
}

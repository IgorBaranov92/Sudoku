import UIKit

class SudokuViewController: GameViewController, SudokuDelegate, EndGameDelegate, NewGameDelegate, TutorialViewDelegate {
    
    // MARK: - Public API
    
    lazy var sudoku = SudokuGenerator(difficult: 0,gameType:gameType,id:id,delegate: self)
    var gameType: GameType = .classic
    var path = String()
    var id = 0
    
    var selectedButton: Cell? { cells.filter { $0.active == true }.first}
    var game = Game()
    var options = Options()
    var statistic = Statistic()
    
    // MARK: - Outlets
    
    @IBOutlet weak var levelChooser: LevelChooser! { didSet {
        levelChooser.delegate = self
        }}

    @IBOutlet private weak var hintView: HintView! { didSet {
        hintView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(showHint(_:))))
        }}
    
    @IBOutlet private weak var eraseView: UIImageView! { didSet {
        eraseView.isUserInteractionEnabled = true
        eraseView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(erase(_:))))
        }}
    
    @IBOutlet var cells: [Cell]! { didSet {
        cells.forEach {
            $0.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(touchField)))
        }}}
    
    @IBOutlet private weak var sudokuView: ClassicSudokuView! { didSet {
        sudokuView.type = gameType
        }}
    
    // MARK: - private vars
    
    private var hasActiveButton: Bool?

    private var gameIndex = 0
    
    // MARK: - ViewController lifecycle
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(clear)))
        restoreOptions()
        restoreStatistic()
        recreateGameIfNeeded()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.addObserver(self, selector: #selector(saveGame), name: UIApplication.willResignActiveNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(updateBoard), name: UIApplication.willEnterForegroundNotification, object: nil)

    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        saveGame()
        NotificationCenter.default.removeObserver(self)
    }
    
    // MARK: - IBActions
    
    @IBAction func showRules(_ sender: UIButton) {
        let tutorialView = TutorialView()
        tutorialView.message = Rules.getRulesDescriptionBasedOn(gameType)
        tutorialView.delegate = self
        view.addSubview(tutorialView)
        TutorialViewConstraint.activate(tutorialView, self.view)
        ViewAppearanceAnimator.show(tutorialView)
    }
    
    @objc
    func erase(_ recognizer: UITapGestureRecognizer) {
        if recognizer.state == .ended {
            hasActiveButton = nil
            guard let button = selectedButton else { return }
            guard let buttonIndex = cells.firstIndex(of: button) else { return }
            guard let title = button.currentTitle else { return }
            let center = button.convert(button.bounds.center, to: stackView)
            let pivot = stackView.convert(center, to: view)
            guard let digit = Int(title) else {
                showErrorAt(pivot, message: "Нельзя стереть пустую клетку")
                return
            }
            if sudoku.mistakesMade.contains(buttonIndex) {// erase only mistakes
                eraseDigit(digit, at: buttonIndex)
                cells[buttonIndex].setTitleColor(.dynamicBlack, for: .normal)

            } else {
                showErrorAt(pivot, message: "Уже решенная клетка")
            }
        }
        
    }
    
    
    @IBAction func digitTouched(_ sender: UIButton) {
        guard let title = sender.currentTitle else { return }
        guard let digit = Int(title) else { return }
        guard hasActiveButton != nil else {
            reset(full:false)
            let indexes = sudoku.highlightAllButtonsBasedOn(digit: digit)
            indexes.active.forEach { cells[$0].active = true }
            if options.options[3] {
                indexes.related.forEach { cells[$0].highlight = true }
            }
            return
        }
        hasActiveButton = nil
        guard let selectedButton = selectedButton else { return }
        guard let index = cells.firstIndex(of: selectedButton) else { return }
        if selectedButton.currentTitle == "" {
            sudoku.cellTouchedAt(index: index, digit: digit,shouldCountMistakes: options.options[0])
            saveGame()
            hideDigitIfPossible()
            TextAppearenceAnimator.show(cells[index], string: title)
            if digit == sudoku.answers[index] { //right digit
                selectedButton.setTitleColor(.dynamicBlack, for: .normal)
            } else { //mistake
                statistic.scores[gameType.rawValue].scores[gameIndex][0] += 1
                saveStatistic()
                if options.options[1] {
                    selectedButton.setTitleColor(.orange, for: .normal)
                } else {
                    selectedButton.setTitleColor(.dynamicBlack, for: .normal)
                }
                updateLabels()
            }
        } else {
            let center = selectedButton.convert(selectedButton.bounds.center, to: stackView)
            let pivot = stackView.convert(center, to: view)
            showErrorAt(pivot, message: "Уже заполненная клетка")
        }
    }
    
    @objc
    func showHint(_ recognier: UITapGestureRecognizer) {
        if recognier.state == .ended {
            guard let selectedButton = selectedButton else { return }
            guard let index = cells.firstIndex(of: selectedButton) else { return }
            if sudoku.digits[index] != 0 { //cell is solved already
                let center = selectedButton.convert(selectedButton.bounds.center, to: stackView)
                let pivot = stackView.convert(center, to: view)
                showErrorAt(pivot, message: "Уже заполненная клетка")
            } else { // empty cell, please hint me
                if sudoku.canHint(index: index) {
                    TextAppearenceAnimator.show(cells[index], string: String(sudoku.answers[index]))
                    updateLabels()
                    hideDigitIfPossible()
                    hasActiveButton = nil
                    saveGame()
                    statistic.scores[gameType.rawValue].scores[gameIndex][1] += 1
                    saveStatistic()
                }
            }
        }
    }
    
    @objc
    private func touchField(_ recognizer: UITapGestureRecognizer) {
        if recognizer.state == .ended {
            if let button = recognizer.view as? Cell,
                let index = cells.firstIndex(of: button) {
                reset(full:false)
                cells[index].active = true
                if options.options[2] {
                    sudoku.highlightButtons(index).forEach { cells[$0].highlight = true }
                }
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
                cells?[index].setTitle("\(sudoku.digits[index])", for: .normal)
            }
            if options.options[1] {
             cells?[index].setTitleColor(sudoku.mistakesMade.contains(index) ? .dynamicOrange : .dynamicBlack, for: .normal)
            } else {
                cells?[index].setTitleColor(.dynamicBlack, for: .normal)
            }
        }
    }
    
    private func updateLabels() {
        mistakesLabel.isHidden = !(options.options[0])
        mistakesLabel.text = "Ошибок: \(sudoku.mistakesMade.count)/\(sudoku.mistakes)"
        hintView.hintsCount = sudoku.hints - sudoku.hintsMade
    }
    
    private func hideDigitIfPossible() {
        if options.options[4] {
            for digit in 1...9 {
                digits[digit-1].isHidden = sudoku.digitsCount[digit] == 9 ? true : false
            }
        }
    }
    
    @objc private func clear() { reset(full: false) }
    
    @objc
    private func reset(full:Bool) {
        print("reset")
        cells.forEach {
            $0.active = false
            $0.highlight = false
            if full {
                $0.setTitle("", for: .normal)
                $0.setTitleColor(.dynamicBlack, for: .normal)
            }
        }
    }
    
    
    private func eraseDigit(_ digit:Int,at index:Int) {
        sudoku.eraseAt(index, digit)
        TextAppearenceAnimator.dismiss(cells[index])
        hideDigitIfPossible()
        saveGame()
    }
    
    
    // MARK: - Gamedelegate

    func gameWon() {
        statistic.scores[gameType.rawValue].scores[gameIndex][2] += 1
        saveStatistic()
        let loseGameView = EndGameView()
        loseGameView.body = "Победа!!!"
        loseGameView.delegate = self
        view.addSubview(loseGameView)
        EndGameViewConstraints.activate(loseGameView, view)
        ViewAppearanceAnimator.show(loseGameView)
    }
    
    func gameLost() {
        statistic.scores[gameType.rawValue].scores[gameIndex][3] += 1
        saveStatistic()
        let loseGameView = EndGameView()
        loseGameView.body = "Игра окончена."
        loseGameView.delegate = self
        view.addSubview(loseGameView)
        EndGameViewConstraints.activate(loseGameView, view)
        ViewAppearanceAnimator.show(loseGameView)
    }
    
    func animateRowWith(_ indexes: Set<Int> ) {
        animatedAt(indexes)
    }
    
    func animateLineWith(_ indexes: Set<Int> ) {
        animatedAt(indexes)
    }
    
    func animateBlockWith(_ indexes: Set<Int> ) {
        animatedAt(indexes)
    }
    
    private func animatedAt(_ indexes:Set<Int> ) {
        reset(full: false)
        indexes.forEach {
            let frame = cells[$0].convert(cells[$0].bounds, to: view)
            let customView = UIView(frame: frame)
            customView.backgroundColor = .selection
            view.insertSubview(customView, at: 0)
            CellAnimator.animate(customView)
        }
    }
    
    func hintsLimitUsed() {
        guard let selectedButton = selectedButton else { return }
        let center = selectedButton.convert(selectedButton.bounds.center, to: stackView)
        let pivot = stackView.convert(center, to: view)
        showErrorAt(pivot, message: "Превышен лимит подсказок")
    }
 
    // MARK: - Restoring and saving games
       
    private func recreateGameIfNeeded() {
        if let url = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true).appendingPathComponent(gameType == .shape ? path + String(id) : path),let data = try? Data(contentsOf: url),let newValue = Game(json: data) {
            game = newValue
            guard let game = game.games[gameIndex] else { newGame();return  }
            if game.gameLost { newGame() }
            else {
                sudoku = game
                sudoku.delegate = self
                updateUI()
                saveGame()
            }
        } else {
            newGame()
        }
    }
    
    private func restoreOptions() {
        if let url = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true).appendingPathComponent("options"),let data = try? Data(contentsOf: url),let newValue = Options(json: data) {
            options = newValue
            updateUI()
            saveOptions()
        }
    }
    
    private func saveOptions() {
        if let url = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true).appendingPathComponent("options"),let json = options.json {
            try? json.write(to: url)
        }
    }
    
    private func restoreStatistic() {
        if let url = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true).appendingPathComponent("statistic"),let data = try? Data(contentsOf: url),let newValue = Statistic(json: data) {
            statistic = newValue
            saveStatistic()
        }
    }
    
    private func saveStatistic() {
        if let url = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true).appendingPathComponent("statistic"),let json = statistic.json {
            try? json.write(to: url)
        }
    }
    
    
    
    @objc
    private func saveGame() {
        if let url = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true).appendingPathComponent(gameType == .shape ? path + String(id) : path),let json = game.json {
            game.games[gameIndex] = sudoku
            try? json.write(to: url)
        }
        
    }
    
    func newGame() {
        reset(full: true)
        digits.forEach { $0.isHidden = false }
        enableUI()
        sudoku = SudokuGenerator(difficult: gameIndex,
                                 gameType:gameType,id:id,
                                 delegate: self) { [weak self] in
                                    DispatchQueue.main.async {
                                        self?.saveGame()
                                        self?.updateUI()
                                    }
        }

    }
    
    
    
    @IBAction func back(_ sender:UIButton) {
        dismiss(animated: true)
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
  
    // MARK: - Protocol conformance
    
    func cancelButtonTouched() {
        dismiss(animated: true)
    }
    
    func createEasyGame() {
        levelChooser.moveTo(0, from: gameIndex)
        gameIndex = 0
    }
    
    func createMediumGame() {
        levelChooser.moveTo(1, from: gameIndex)
        gameIndex = 1
    }
    
    func createHardGame() {
        levelChooser.moveTo(2, from: gameIndex)
        gameIndex = 2
    }
    
    func createNewGame() {
        
    }
    
    
    func enableUI() {
        view.subviews.forEach { $0.isUserInteractionEnabled = true }
        cells.forEach { $0.isUserInteractionEnabled = true }
        sudokuView?.isUserInteractionEnabled = false
    }
    
}

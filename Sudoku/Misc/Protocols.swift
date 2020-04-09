import Foundation

protocol SudokuDelegate: class {
    func gameLost()
    func gameWon()
    func hintsLimitUsed()
    func animateRowWith(_ indexes:[Int])
    func animateLineWith(_ indexes:[Int])
    func animateBlockWith(_ indexes:[Int])
}

protocol EraseViewDelegate: class {
    func eraseConfirmed()
    func eraseCanceled()
}

protocol GameLostDelegate: class {
    
}

import Foundation

protocol SudokuDelegate: class {
    func gameLost()
    func gameWon()
    func hintsLimitUsed()
    func animateRowWith(_ indexes:Set<Int>)
    func animateLineWith(_ indexes:Set<Int>)
    func animateBlockWith(_ indexes:Set<Int>)
}

protocol EraseViewDelegate: class {
    func eraseConfirmed()
    func eraseCanceled()
}

protocol EraseAllViewDelegate:class {
    func eraseAllCanceled()
    func eraseAllConfirmed()
}

protocol GameLostDelegate: class {
    
}

protocol NewGameDelegate: class {
    func recreateGameIfNeededAt(_ index:Int)
}

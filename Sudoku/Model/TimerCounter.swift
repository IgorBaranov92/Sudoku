import Foundation

class TimeCounter {
    
    static func getTime(_ seconds:Int) -> String {
        let minutes = seconds/60
        let hours = minutes/60
        let newSeconds = seconds - minutes*60
        var result = hours <= 9 ? "0" : ""
        let sec = newSeconds <= 9 ? "0" : ""
        result = "\(hours)\(minutes):\(sec+String(newSeconds))"
        return result
    }
    
}

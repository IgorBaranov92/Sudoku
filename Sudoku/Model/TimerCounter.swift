import Foundation

class TimerCounter {
    
    static func getTime(_ seconds:Int,completion:@escaping ()->Void ) -> String {
        if seconds >= 60*100 {
            completion()
            return "99:59"
        }
        let minutes = seconds/60
        let newSeconds = seconds - minutes*60
        var result = minutes <= 9 ? "0" : ""
        let sec = newSeconds <= 9 ? "0" : ""
        result += "\(minutes):\(sec+String(newSeconds))"
        return result
    }
    
}

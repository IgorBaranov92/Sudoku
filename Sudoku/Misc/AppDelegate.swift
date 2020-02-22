import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        if UserDefaults.standard.value(forKey: "index") == nil {
            UserDefaults.standard.set(0, forKey: "index")
        }
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        
    }
  
    

}


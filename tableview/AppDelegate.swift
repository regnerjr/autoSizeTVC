import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

	var window: UIWindow?

	func application(application: UIApplication,
		didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {

		let screenBounds = UIScreen.mainScreen().bounds
		window = UIWindow(frame: screenBounds)
		window?.makeKeyAndVisible()
		window?.rootViewController = ViewController()
		return true
	}
}

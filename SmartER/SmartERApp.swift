import SwiftUI
import FirebaseCore

//AppDelegate for Firebase
class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
    }
}

@main
struct SmartERApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @StateObject var logoutModel = LogoutModel()

    var body: some Scene {
        WindowGroup {
            if logoutModel.isLoggedIn {
                ContentView()
                    .environmentObject(logoutModel)
            } else {
                LoginView()
                    .environmentObject(logoutModel)
            }
        }
    }
}

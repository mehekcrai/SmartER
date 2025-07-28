import SwiftUI
import Combine

//login/logout  across the app
class LogoutModel: ObservableObject {
    //start logged out by default
    @Published var isLoggedIn: Bool = false
    
//logout
    func logout() {
        isLoggedIn = false
    }
    
//login
    func login() {
        isLoggedIn = true
    }
}

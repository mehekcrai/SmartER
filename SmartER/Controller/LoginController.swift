import Foundation
import FirebaseAuth

class LoginController: ObservableObject {
    @Published var errorMessage: String?

    func loginUser(email: String, password: String, completion: @escaping (Bool) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            DispatchQueue.main.async {
                if let error = error {
                    self.errorMessage = error.localizedDescription
                    completion(false)
                } else {
                    self.errorMessage = nil
                    print("User logged in successfully!")
                    completion(true)
                }
            }
        }
    }
}

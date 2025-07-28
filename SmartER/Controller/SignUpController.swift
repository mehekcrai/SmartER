import Foundation
import FirebaseAuth
import FirebaseFirestore

class SignUpController: ObservableObject {
    @Published var errorMessage: String?
    
    func isValidEmail(_ email: String) -> Bool {
            let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
            return NSPredicate(format: "SELF MATCHES %@", emailRegEx).evaluate(with: email)
        }
        
        func isValidPassword(_ password: String) -> Bool {
            return password.count >= 6
        }

    func signUpUser(name: String, email: String, password: String, confirmPassword: String, completion: @escaping (Bool) -> Void) {
        guard password == confirmPassword else {
            self.errorMessage = "Passwords do not match."
            completion(false)
            return
        }
        guard isValidEmail(email) else {
                    self.errorMessage = "Invalid email format."
                    completion(false)
                    return
                }
                
                guard isValidPassword(password) else {
                    self.errorMessage = "Password too weak."
                    completion(false)
                    return
                }
        
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                DispatchQueue.main.async {
                    self.errorMessage = error.localizedDescription
                    completion(false)
                }
            } else if let user = result?.user {
                //save additional user info to Firestore
                let db = Firestore.firestore()
                let userData: [String: Any] = [
                    "name": name,
                    "email": email,
                    "createdAt": Date()
                ]
                db.collection("users").document(user.uid).setData(userData) { error in
                    DispatchQueue.main.async {
                        if let error = error {
                            self.errorMessage = "Firestore error: \(error.localizedDescription)"
                            completion(false)
                        } else {
                            completion(true)
                        }
                    }
                }
            }
        }
    }
}

import SwiftUI

struct SignUpView: View {
    @StateObject private var controller = SignUpController()
    @EnvironmentObject var logoutModel: LogoutModel
    @State private var fullName = ""
    @State private var email = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @State private var showPassword = false
    @State private var showConfirmPassword = false

    var body: some View {
        ZStack {
            Color(red: 0.0, green: 0.22, blue: 0.39).opacity(0.1)
                .ignoresSafeArea()

            //logo
            VStack(spacing: 10) {
                Image("BlueCropped")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 60)

                Text("Recommendations for your education.")
                    .font(Font.custom("Poppins-Regular", size: 14))
                    .foregroundColor(Color(red: 0, green: 0.22, blue: 0.39))

                Text("Sign Up Now")
                    .font(Font.custom("Poppins-Bold", size: 26))
                    .foregroundColor(.black)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
                    .padding(.top, 10)

                Spacer().frame(height: 10)

                VStack(alignment: .leading, spacing: 5) {
                    Text("Full Name")
                        .font(Font.custom("Poppins-Medium", size: 14))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    TextField("", text: $fullName)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(30)
                }
                .padding(.horizontal)

                VStack(alignment: .leading, spacing: 5) {
                    Text("Email Address")
                        .font(Font.custom("Poppins-Medium", size: 14))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    TextField("", text: $email)
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(30)
                }
                .padding(.horizontal)

                VStack(alignment: .leading, spacing: 5) {
                    Text("Password")
                        .font(Font.custom("Poppins-Medium", size: 14))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    HStack {
                        if showPassword {
                            TextField("", text: $password)
                        } else {
                            SecureField("", text: $password)
                        }
                        Button(action: { showPassword.toggle() }) {
                            Image(systemName: showPassword ? "eye.slash.fill" : "eye.fill")
                                .foregroundColor(.gray)
                        }
                    }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(30)
                }
                .padding(.horizontal)

                VStack(alignment: .leading, spacing: 5) {
                    Text("Confirm Password")
                        .font(Font.custom("Poppins-Medium", size: 14))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    HStack {
                        if showConfirmPassword {
                            TextField("", text: $confirmPassword)
                        } else {
                            SecureField("", text: $confirmPassword)
                        }
                        Button(action: { showConfirmPassword.toggle() }) {
                            Image(systemName: showConfirmPassword ? "eye.slash.fill" : "eye.fill")
                                .foregroundColor(.gray)
                        }
                    }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(30)
                }
                .padding(.horizontal)

                Spacer().frame(height: 20)

                Button(action: {
                    controller.signUpUser(name: fullName, email: email, password: password, confirmPassword: confirmPassword) { success in
                        if success {
                            logoutModel.login() //switch to ContentView
                        }
                    }
                }) {
                    Text("Sign Up")
                        .font(Font.custom("Poppins-Bold", size: 16))
                        .frame(width: 200, height: 50)
                        .background(Color(red: 0.0, green: 0.2, blue: 0.4))
                        .foregroundColor(.white)
                        .cornerRadius(30)
                        .shadow(color: .gray.opacity(0.6), radius: 4, x: 0, y: 2)
                }
                .frame(maxWidth: .infinity)

                if let errorMessage = controller.errorMessage {
                    Text(errorMessage)
                        .foregroundColor(.red)
                        .font(.caption)
                        .padding()
                }

                HStack {
                    Text("Already have an account?")
                        .font(Font.custom("Poppins-Medium", size: 14))
                        .foregroundColor(.black.opacity(0.7))
                    NavigationLink("Log in") {
                        LoginView()
                            .environmentObject(logoutModel)
                    }
                    .font(Font.custom("Poppins-Regular", size: 14))
                    .foregroundColor(Color(red: 0, green: 0.22, blue: 0.39))
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            .padding(.top, 40)
            .padding()
        }
    }
}

#Preview {
    NavigationView {
        SignUpView()
            .environmentObject(LogoutModel())
    }
}

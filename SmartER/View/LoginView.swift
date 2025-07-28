import SwiftUI

struct LoginView: View {
    @StateObject private var controller = LoginController()
    @EnvironmentObject var logoutModel: LogoutModel
    @State private var email = ""
    @State private var password = ""
    @State private var showPassword = false

    var body: some View {
        NavigationStack {
            ZStack {
                Color(red: 0.0, green: 0.22, blue: 0.39).opacity(0.1)
                    .ignoresSafeArea()

                VStack(spacing: 10) {
                    Image("BlueCropped")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 150, height: 60)

                    Text("Recommendations for your education.")
                        .font(Font.custom("Poppins-Regular", size: 14))
                        .foregroundColor(Color(red: 0, green: 0.22, blue: 0.39))

                    Text("Log In")
                        .font(Font.custom("Poppins-Bold", size: 26))
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal)
                        .padding(.top, 10)

                    Spacer().frame(height: 10)

                    //email input field
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Email Address")
                            .font(Font.custom("Poppins-Medium", size: 14))
                            .foregroundColor(.black)
                            .frame(maxWidth: .infinity, alignment: .leading)

                        TextField("", text: $email)
                            .keyboardType(.emailAddress)
                            .autocapitalization(.none)
                            .padding()
                            .background(Color.white)
                            .cornerRadius(30)
                    }
                    .padding(.horizontal)

                    //password input field
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Password")
                            .font(Font.custom("Poppins-Medium", size: 14))
                            .foregroundColor(.black)
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

                    Spacer().frame(height: 20)

                    Button(action: {
                        controller.loginUser(email: email, password: password) { success in
                            if success {
                                logoutModel.login() //switch to ContentView
                            }
                        }
                    }) {
                        Text("Login")
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
                        Text("Don't have an account?")
                            .font(Font.custom("Poppins-Medium", size: 14))
                            .foregroundColor(.black.opacity(0.7))
                        NavigationLink("Sign Up") {
                            SignUpView()
                                .environmentObject(logoutModel) //pass the same LogoutModel
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
}

#Preview {
    NavigationView {
        LoginView()
            .environmentObject(LogoutModel())
    }
}

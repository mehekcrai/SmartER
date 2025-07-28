import SwiftUI
import FirebaseAuth
import FirebaseFirestore

struct ProfileView: View {
    @EnvironmentObject var logoutModel: LogoutModel
    @State private var fullName: String = ""  //to store the user's name

    var body: some View {
        NavigationView {
            VStack(spacing: 30) {
                
                //title and logout button
                HStack {
                    Text("Profile")
                        .font(Font.custom("Poppins-Bold", size: 30))
                        .foregroundColor(.black)
                    
                    Spacer()
                    
                    Button(action: {
                        logoutModel.logout()
                    }) {
                        Text("Log Out")
                            .font(Font.custom("Poppins-Bold", size: 12))
                            .frame(width: 80, height: 40)
                            .background(Color(red: 0, green: 0.22, blue: 0.39))
                            .cornerRadius(30)
                            .foregroundColor(.white)
                            .shadow(color: .gray.opacity(0.4), radius: 2, x: 0, y: 4)
                    }
                }
                .padding(.top, 10)
                
                //profile info
                HStack(spacing: 16) {
                    Image(systemName: "person.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 70, height: 70)
                        .foregroundColor(Color(red: 0, green: 0.22, blue: 0.39))
                        .padding(.leading, 10)
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Full Name: \(fullName.isEmpty ? "Loading..." : fullName)")
                        Text("Birth Year:")
                        Text("Institution:")
                        Text("Year Group:")
                    }
                    .font(Font.custom("NotoSansMyanmar-Light", size: 12))
                    .foregroundColor(.black)
                }
                .padding(15)
                .frame(maxWidth: 350)
                .background(Color(red: 0, green: 0.22, blue: 0.39).opacity(0.1))
                .cornerRadius(30)
                .shadow(color: .black.opacity(0.15), radius: 2, x: 0, y: 4)
                .onAppear {
                    fetchUserFullName()
                }
                
                //my docs
                NavigationLink(destination: MyDocumentsView()) {
                    RectangleButton(title: "My Documents")
                }
                .frame(maxWidth: 350, alignment: .leading)

                //SMART MATCH
                VStack(alignment: .leading, spacing: 20) {
                    Text("Smart Match")
                        .font(Font.custom("Poppins-Bold", size: 25))
                        .foregroundColor(.black)
                        .padding(.bottom, 5)
                    
                    VStack(spacing: 15) {
                        NavigationLink(destination: MyInterestsView()) {
                            RectangleButton(title: "My Interests")
                        }
                        NavigationLink(destination: MySkillsView()) {
                            RectangleButton(title: "My Skills")
                        }
                        NavigationLink(destination: MyAmbitionsView()) {
                            RectangleButton(title: "My Ambitions & Goals")
                        }
                        NavigationLink(destination: MyLearningView()) {
                            RectangleButton(title: "My Learning Style")
                        }
                        NavigationLink(destination: MyStudyingView()) {
                            RectangleButton(title: "My Study Preferences")
                        }
                    }
                }
                .frame(maxWidth: 350, alignment: .leading)
                
                Spacer(minLength: 20)
            }
            .padding(.horizontal, 20)
            .background(Color.white.ignoresSafeArea())
        }
    }
    
    // fetch user's fullnmae from firestore
    func fetchUserFullName() {
        guard let uid = Auth.auth().currentUser?.uid else {
            print("No logged-in user.")
            return
        }
        
        let db = Firestore.firestore()
        db.collection("users").document(uid).getDocument { document, error in
            if let error = error {
                print("Error fetching user document: \(error.localizedDescription)")
                return
            }
            if let document = document, document.exists {
                if let name = document.get("name") as? String {
                    DispatchQueue.main.async {
                        self.fullName = name
                    }
                } else {
                    print("No name field found in document.")
                }
            } else {
                print("User document does not exist.")
            }
        }
    }
}

struct RectangleButton: View {
    var title: String
    
    var body: some View {
        Text(title)
            .font(Font.custom("NotoSansMyanmar-Light", size: 16))
            .foregroundColor(.black)
            .padding(.horizontal, 20)
            .frame(maxWidth: .infinity, minHeight: 45, alignment: .leading)
            .background(
                Color(red: 0, green: 0.22, blue: 0.39)
                    .opacity(0.1)
                    .cornerRadius(30)
                    .shadow(color: .black.opacity(0.3), radius: 2, x: 0, y: 4)
            )
    }
}

#Preview {
    ProfileView().environmentObject(LogoutModel())
}

import SwiftUI

struct MyStudyingView: View {
    @Environment(\.dismiss) var dismiss
    @State private var preferences: [StudyPreference] = []

    var body: some View {
        VStack {
            ScrollView {
                VStack(spacing: 20) {
                    ForEach(preferences.indices, id: \.self) { index in
                        VStack {
                            Image(preferences[index].imageName)
                                .resizable()
                                .scaledToFill()
                                .frame(width: UIScreen.main.bounds.width - 40, height: 180)
                                .clipShape(RoundedRectangle(cornerRadius: 20))
                                .opacity(preferences[index].isSelected ? 1.0 : 0.4)
                                .onTapGesture {
                                    preferences[index].isSelected.toggle()
                                }

                            Text(preferences[index].name)
                                .font(Font.custom("Poppins-Regular", size: 14))
                                .foregroundColor(.black)
                                .multilineTextAlignment(.center)
                        }
                    }
                }
                .padding()
            }

            //to update
            Button(action: {
                ProfileController.shared.saveStudyPreferences(preferences)
                dismiss()
            }) {
                Text("Update")
                    .font(Font.custom("Poppins-Bold", size: 16))
                    .foregroundColor(.white)
                    .frame(width: 120, height: 45)
                    .background(Color(red: 0, green: 0.22, blue: 0.39))
                    .cornerRadius(25)
            }
            .padding()
        }
        .background(Color.white.ignoresSafeArea())
        .onAppear {
            preferences = ProfileController.shared.loadStudyPreferences()
        }
        .navigationTitle("My Studying Preferences")
    }
}

#Preview {
    MyStudyingView()
}

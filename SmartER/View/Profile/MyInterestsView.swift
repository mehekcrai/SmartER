import SwiftUI

struct MyInterestsView: View {
    @Environment(\.dismiss) var dismiss
    @State private var interests: [Interest] = []

    //grid layout
    let columns = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]

    var body: some View {
        VStack {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(interests.indices, id: \.self) { index in
                        VStack {
                            Image(interests[index].imageName)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 120, height: 120)
                                .clipShape(RoundedRectangle(cornerRadius: 20))
                                .opacity(interests[index].isSelected ? 1.0 : 0.4)
                                .onTapGesture {
                                    interests[index].isSelected.toggle()
                                }

                            Text(interests[index].name)
                                .font(Font.custom("Poppins-Regular", size: 12))
                                .foregroundColor(.black)
                                .multilineTextAlignment(.center)
                        }
                    }
                }
                .padding()
            }

            //to update
            Button(action: {
                ProfileController.shared.saveInterests(interests)
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
            interests = ProfileController.shared.loadInterests()
        }
        .navigationTitle("My Interests")
    }
}

#Preview {
    MyInterestsView()
}

import SwiftUI

struct MyAmbitionsView: View {
    @Environment(\.dismiss) var dismiss
    @State private var careerAmbitions: [Ambition] = []
    @State private var lifestyleAmbitions: [Ambition] = []
    @State private var personalImpact: [Ambition] = []

    var body: some View {
        ScrollView {
            Spacer()
            VStack(alignment: .leading, spacing: 20) {
                //career and ambition
                VStack(alignment: .leading, spacing: 10) {
                    Text("Career & Ambition")
                        .font(Font.custom("Poppins-Bold", size: 20))
                    ForEach(careerAmbitions.indices, id: \.self) { index in
                        AmbitionRow(ambition: $careerAmbitions[index])
                    }
                }

                //lifestyle and work style
                VStack(alignment: .leading, spacing: 10) {
                    Text("Lifestyle & Work Style")
                        .font(Font.custom("Poppins-Bold", size: 20))
                    ForEach(lifestyleAmbitions.indices, id: \.self) { index in
                        AmbitionRow(ambition: $lifestyleAmbitions[index])
                    }
                }

                //personal impact
                VStack(alignment: .leading, spacing: 10) {
                    Text("Personal Impact")
                        .font(Font.custom("Poppins-Bold", size: 20))
                    ForEach(personalImpact.indices, id: \.self) { index in
                        AmbitionRow(ambition: $personalImpact[index])
                    }
                }

                //to update
                Button(action: {
                    ProfileController.shared.saveAmbitions(
                        career: careerAmbitions,
                        lifestyle: lifestyleAmbitions,
                        personal: personalImpact
                    )
                    dismiss()
                }) {
                    Text("Update")
                        .font(Font.custom("Poppins-Bold", size: 16))
                        .foregroundColor(.white)
                        .frame(width: 140, height: 50)
                        .background(Color(red: 0, green: 0.22, blue: 0.39))
                        .cornerRadius(30)
                        .shadow(color: Color.black.opacity(0.2), radius: 4, x: 0, y: 2)
                }
                .padding(.vertical, 20)
            }
            .padding(.horizontal, 20)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .background(Color.white.ignoresSafeArea())
        .onAppear {
            careerAmbitions = ProfileController.shared.loadCareerAmbitions()
            lifestyleAmbitions = ProfileController.shared.loadLifestyleAmbitions()
            personalImpact = ProfileController.shared.loadPersonalAmbitions()
        }
        .navigationTitle("My Ambitions & Goals")
    }
}

struct AmbitionRow: View {
    @Binding var ambition: Ambition

    var body: some View {
        Button(action: {
            ambition.isSelected.toggle()
        }) {
            Text(ambition.name)
                .font(Font.custom("Poppins-Regular", size: 12))
                .foregroundColor(ambition.isSelected ? .black : .gray)
                .padding(.vertical, 8)
                .padding(.horizontal, 12)
                .background(
                    RoundedRectangle(cornerRadius: 30)
                        .fill(ambition.isSelected ? Color(hex: "#FFEEAF") : Color(hex: "#E5EBEF"))
                )
        }
        .buttonStyle(PlainButtonStyle())
    }
}

#Preview {
    MyAmbitionsView()
}

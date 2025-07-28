import SwiftUI

struct MySkillsView: View {
    @Environment(\.dismiss) var dismiss
    @State private var softSkills: [Skill] = []
    @State private var hardSkills: [Skill] = []

    let columns = Array(repeating: GridItem(.flexible(), spacing: 10), count: 3)

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {

                //soft skills
                VStack(alignment: .leading, spacing: 10) {
                    Text("Soft Skills")
                        .font(Font.custom("Poppins-Bold", size: 20))
                    Text("Personal strengths in how you think, communicate and work with others. Select 3-7 soft skills.")
                        .font(Font.custom("Poppins-Regular", size: 10))
                        .foregroundColor(.gray)

                    LazyVGrid(columns: columns, spacing: 10) {
                        ForEach(softSkills.indices, id: \.self) { index in
                            SkillButton(skill: $softSkills[index])
                        }
                    }
                }

                //hard skills
                VStack(alignment: .leading, spacing: 10) {
                    Text("Hard Skills")
                        .font(Font.custom("Poppins-Bold", size: 20))
                    Text("Practical abilities you can learn, measure, or apply to tasks. Select 3-7 hard skills.")
                        .font(Font.custom("Poppins-Regular", size: 10))
                        .foregroundColor(.gray)

                    LazyVGrid(columns: columns, spacing: 10) {
                        ForEach(hardSkills.indices, id: \.self) { index in
                            SkillButton(skill: $hardSkills[index])
                        }
                    }
                }

                //to update
                HStack {
                    Spacer()
                    Button(action: {
                        ProfileController.shared.saveSkills(soft: softSkills, hard: hardSkills)
                        dismiss()
                    }) {
                        Text("Update")
                            .font(Font.custom("Poppins-Bold", size: 16))
                            .foregroundColor(.white)
                            .frame(width: 120, height: 45)
                            .background(Color(red: 0, green: 0.22, blue: 0.39))
                            .cornerRadius(25)
                    }
                }
                .padding(.top, 20)
            }
            .padding()
        }
        .background(Color.white.ignoresSafeArea())
        .onAppear {
            softSkills = ProfileController.shared.loadSoftSkills()
            hardSkills = ProfileController.shared.loadHardSkills()
        }
        .navigationTitle("My Skills")
    }
}

struct SkillButton: View {
    @Binding var skill: Skill

    var body: some View {
        Text(skill.name)
            .font(Font.custom("Poppins-Regular", size: 10))
            .padding(.vertical, 8)
            .padding(.horizontal, 12)
            .frame(minWidth: 100)
            .background(skill.isSelected ? Color(hex: "#FFEEAF") : Color(hex: "#E5EBEF"))
            .cornerRadius(30)
            .onTapGesture {
                skill.isSelected.toggle()
            }
    }
}

#Preview {
    MySkillsView()
}


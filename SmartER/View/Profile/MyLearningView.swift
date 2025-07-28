
import SwiftUI

struct MyLearningView: View {
    @Environment(\.dismiss) var dismiss
    @State private var learningStyles: [LearningStyle] = []

    //2 columns layout
    let columns = [GridItem(.flexible()), GridItem(.flexible())]

    var body: some View {
        VStack {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(learningStyles.indices, id: \.self) { index in
                        VStack {
                            Image(learningStyles[index].imageName)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 160, height: 160)
                                .clipShape(RoundedRectangle(cornerRadius: 20))
                                .opacity(learningStyles[index].isSelected ? 1.0 : 0.4)
                                .onTapGesture {
                                    learningStyles[index].isSelected.toggle()
                                }

                            Text(learningStyles[index].name)
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
                ProfileController.shared.saveLearningStyles(learningStyles)
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
            learningStyles = ProfileController.shared.loadLearningStyles()
        }
        .navigationTitle("My Learning Style")
    }
}

#Preview {
    MyLearningView()
}

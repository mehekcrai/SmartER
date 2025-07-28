import SwiftUI

struct SavedView: View {

    var body: some View {
        VStack {
            Text("Saved")
                .font(Font.custom("Poppins-Bold", size: 24))
                .padding(.top, 20)
            Spacer()
            Image(systemName: "heart.fill")
                .resizable()
                .foregroundColor(Color(red: 0, green: 0.22, blue: 0.39))
                .scaledToFit()
                .frame(width: 200, height: 200)
                .padding()
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.white.ignoresSafeArea())
        .navigationTitle("Saved")
    }
}

#Preview {
    SavedView()
}

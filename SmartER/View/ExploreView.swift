import SwiftUI

struct ExploreView: View {

    var body: some View {
        VStack {
            Text("Explore")
                .font(Font.custom("Poppins-Bold", size: 24))
                .padding(.top, 20)
            Spacer()
            Image(systemName: "magnifyingglass")
                .resizable()
                .foregroundColor(Color(red: 0, green: 0.22, blue: 0.39))
                .scaledToFit()
                .frame(width: 200, height: 200)
                .padding()
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.white.ignoresSafeArea())
        .navigationTitle("Explore")
    }
}

#Preview {
    ExploreView()
}

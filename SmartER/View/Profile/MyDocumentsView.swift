import SwiftUI

struct MyDocumentsView: View {
    var body: some View {
        VStack {
            Spacer()
            Image(systemName: "document.on.document.fill")
                .resizable()
                .foregroundColor(Color(red: 0, green: 0.22, blue: 0.39))
                .scaledToFit()
                .frame(width: 200, height: 200)
                .padding()
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.white.ignoresSafeArea())
        .navigationTitle("My Documents")
    }
}

#Preview {
    MyDocumentsView()
}


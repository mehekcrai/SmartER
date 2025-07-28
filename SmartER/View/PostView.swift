import SwiftUI

struct PostView: View {
    @State private var selectedSegment = "Insight"
    @State private var selectedSubject = ""
    @State private var titleText = ""
    @State private var bodyText = ""
    @State private var showDropdown = false
    @State private var selectedSubjects: [String] = []
    @State private var allSubjects = ["Math", "Science", "History", "English", "Art"]

    var body: some View {
        //title
        Button(action: {
            // TODO: Add functionality here
        }) {
            Text("Post")
                .font(
                    Font.custom("Poppins-Bold", size: 24)
                )
                .padding()
                .background(Color(red: 0, green: 0.22, blue: 0.39))
                .foregroundColor(.white)
                .cornerRadius(30)
        }
        .padding(.top, 10)
        SlidingButtonSegment(selected: $selectedSegment)
        VStack(spacing: 10) {
            
            
            //dropdown
            VStack(spacing: 5) {
                HStack {
                    Text("Select relevant subjects.")
                        .foregroundColor(.gray)
                        .font(.custom("Poppins-Regular", size: 14))
                    Spacer()
                    Button(action: {
                        withAnimation {
                            showDropdown.toggle()
                        }
                    }) {
                        Image(systemName: "chevron.down.circle.fill")
                            .resizable()
                            .foregroundColor(Color(red: 0, green: 0.22, blue: 0.39))
                            .frame(width: 15, height: 15)
                            .rotationEffect(.degrees(showDropdown ? 180 : 0))
                    }
                }
                .padding()
                .background(Color(red: 0, green: 0.22, blue: 0.39).opacity(0.1))
                .cornerRadius(30)
                .padding(.horizontal)

                //selected tags
                if !selectedSubjects.isEmpty {
                    HStack(spacing: 10) {
                        ForEach(selectedSubjects, id: \.self) { subject in
                            TagView(title: subject) {
                                if let index = selectedSubjects.firstIndex(of: subject) {
                                    selectedSubjects.remove(at: index)
                                }
                            }
                        }
                    }
                    .padding(.horizontal)
                }
            }
            
            //title input
            VStack(alignment: .leading, spacing: 8) {
                Text("Title")
                    .font(.custom("Poppins-SemiBold", size: 24))
                    .foregroundColor(.black)
                TextField("Title", text: $titleText)
                    .padding()
                    .background(Color(red: 0, green: 0.22, blue: 0.39).opacity(0.1))
                    .cornerRadius(30)
            }
            .padding(.horizontal)
            
            //bodytext
            VStack(alignment: .leading, spacing: 8) {
                Text("Body Text")
                    .font(.custom("Poppins-SemiBold", size: 18))
                    .foregroundColor(.black)
                ZStack(alignment: .topLeading) {
                    RoundedRectangle(cornerRadius: 30)
                        .fill(Color(red: 0, green: 0.22, blue: 0.39).opacity(0.1))
                        .frame(height: 200)

                    TextEditor(text: $bodyText)
                        .padding()
                        .frame(height: 200)
                        .scrollContentBackground(.hidden) //iOS 16+ solution
                }
            }
            .padding(.horizontal)
            
            //attachments toolbar
            HStack {
                HStack(spacing: 15) {
                    ToolbarIcon(systemName: "camera.fill")
                    ToolbarIcon(systemName: "photo.fill")
                    ToolbarIcon(systemName: "document.fill")
                    ToolbarIcon(systemName: "chart.bar.fill")
                    ToolbarIcon(systemName: "mappin")
                }
                .padding(.horizontal)
                .frame(height: 50)
                .background(Color(red: 0, green: 0.22, blue: 0.39).opacity(0.8))
                .cornerRadius(30)
                .foregroundColor(.white)

                Spacer()

                Button(action: {
                    //anonymity feature- future implementation
                }) {
                    Image(systemName: "shield.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 25, height: 25)
                        .padding(12)
                        .background(Color(red: 0, green: 0.22, blue: 0.39).opacity(0.8))
                        .clipShape(Circle())
                        .foregroundColor(.white)
                        .shadow(radius: 3)
                }
            }
            .padding(.horizontal)
            .padding(.bottom, 10)
        }
        .padding(.top, 20)
        .background(Color.white)
        .overlay(alignment: .topTrailing) {
            if showDropdown {
                DropdownView(selectedSubjects: $selectedSubjects, allSubjects: allSubjects)
                    .frame(width: 200)
                    .offset(y: 60)
                    .padding(.trailing, 20)
                    .transition(.opacity)
                    .zIndex(10)
            }
        }
    }
}


struct TagView: View {
    var title: String
    var onDelete: (() -> Void)?
    
    var body: some View {
        HStack(spacing: 5) {
            Text(title)
                .font(.custom("Poppins-Regular", size: 14))
                .foregroundColor(.black)
            Button(action: {
                onDelete?()
            }) {
                Image(systemName: "xmark.circle.fill")
                    .resizable()
                    .frame(width: 14, height: 14)
                    .foregroundColor(.gray)
            }
        }
        .padding(.vertical, 6)
        .padding(.horizontal, 12)
        .background(Color.gray.opacity(0.1))
        .cornerRadius(20)
    }
}

struct ToolbarIcon: View {
    var systemName: String
    var body: some View {
        Image(systemName: systemName)
            .resizable()
            .scaledToFit()
            .frame(width: 24, height: 24)
            .foregroundColor(.white)
    }
}

struct DropdownView: View {
    @Binding var selectedSubjects: [String]
    let allSubjects: [String]
    var onSelect: ((String) -> Void)? = nil

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 8) {
                ForEach(allSubjects, id: \.self) { subject in
                    Button(action: {
                        if !selectedSubjects.contains(subject) {
                            selectedSubjects.append(subject)
                            onSelect?(subject)
                        }
                    }) {
                        Text(subject)
                            .foregroundColor(.black)
                            .padding(.vertical, 5)
                            .padding(.horizontal, 10)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(Color.gray.opacity(0.1))
                            .cornerRadius(30)
                    }
                }
            }
            .padding(5)
        }
        .frame(height: 120)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 2)
        .padding(.horizontal)
    }
}

#Preview {
    PostView()
}

struct SlidingButtonSegment: View {
    @Binding var selected: String
    let segments = ["Insight", "Question"]

    var body: some View {
        GeometryReader { geo in
            let segmentWidth = geo.size.width / CGFloat(segments.count)

            ZStack(alignment: .leading) {
                //background capsule
                Capsule()
                    .fill(Color(red: 0, green: 0.22, blue: 0.39).opacity(0.1))
                    .frame(height: 45)

                //sliding capsule
                Capsule()
                    .fill(Color(red: 0, green: 0.22, blue: 0.39))
                    .frame(width: segmentWidth, height: 45)
                    .offset(x: selected == "Question" ? segmentWidth : 0)
                    .animation(.easeInOut(duration: 0.3), value: selected)

                //text buttons
                HStack(spacing: 0) {
                    ForEach(segments, id: \.self) { segment in
                        Button(action: { selected = segment }) {
                            Text(segment)
                                .font(.custom("Poppins-Bold", size: 16))
                                .frame(maxWidth: .infinity)
                                .foregroundColor(selected == segment ? .white : .gray)
                        }
                    }
                }
            }
        }
        .frame(height: 45)
        .padding(.horizontal)
    }
}

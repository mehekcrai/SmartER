import SwiftUI

struct ForYouView: View {
    //data fromcontroller
    @State private var data = ForYouModel()
    
    //placeholder-
    @State private var courses: [String] = [
        "Computer Science", "Digital Marketing", "Graphic Design", "Finance", "AI & Robotics"
    ]
    @State private var careers: [String] = [
        "Software Developer", "Data Analyst", "UX Designer",
        "Marketing Manager", "Teacher"
    ]
    
    //#0038641A shades from figma
    private let navyShades = [
        Color(red: 0/255, green: 56/255, blue: 100/255).opacity(1.0),
        Color(red: 0/255, green: 56/255, blue: 100/255).opacity(0.8),
        Color(red: 0/255, green: 56/255, blue: 100/255).opacity(0.6),
        Color(red: 0/255, green: 56/255, blue: 100/255).opacity(0.4),
        Color(red: 0/255, green: 56/255, blue: 100/255).opacity(0.2),
        Color(red: 0/255, green: 56/255, blue: 100/255).opacity(0.1)

    ]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 25) {
                    
                    //subject sets
                    Spacer().frame(height: 5)
                    SectionHeader(title: "Smart Subject Sets",
                                  subtitle: "Top 5 combos that match how you think and learn.")
                        .padding(.horizontal, 20)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 15) {
                            ForEach(0..<data.subjects.count, id: \.self) { index in
                                SmartSubjectCard(subjects: data.subjects[index],
                                                 color: navyShades[index % navyShades.count])
                                .padding(.leading, index == 0 ? 20 : 0)
                                .padding(.trailing, index == data.subjects.count - 1 ? 20 : 0)
                            }
                        }
                    }
                    
                    //insightful journeys
                    Spacer().frame(height: 5)
                    VStack(alignment: .leading, spacing: 10) {
                        Spacer().frame(height: 10)
                    SectionHeader(title: "Insightful Journeys",
                                  subtitle: "Stories that align with your interests and goals.")
                        .padding(.horizontal, 20)
                    
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 10) {
                                ForEach(0..<data.journeys.count, id: \.self) { index in
                                    JourneyCard(title: data.journeys[index])
                                        .frame(width: 180 - CGFloat(index * 10),
                                               height: 200 - CGFloat(index * 10))
                                        .padding(.leading, index == 0 ? 20 : 0)
                                        .padding(.trailing, index == data.journeys.count - 1 ? 20 : 0)
                                }
                            }
                            Spacer().frame(height: 30)
                        }
                    }
                    .padding(.vertical, 10)
                    .background(navyShades[5])
                    
                   
                    
                    //course recs
                    SectionHeader(title: "Course Recommendations",
                                  subtitle: "Degrees that align with what you're good at.")
                        .padding(.horizontal, 20)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 15) {
                            ForEach(0..<courses.count, id: \.self) { index in
                                CourseCard(title: courses[index],
                                           color: navyShades[index % navyShades.count])
                                .padding(.leading, index == 0 ? 20 : 0)
                                .padding(.trailing, index == courses.count - 1 ? 20 : 0)
                            }
                        }
                    }
                    
                    //career matches
                    Spacer().frame(height: 5)
                    VStack(alignment: .leading, spacing: 10) {
                        Spacer().frame(height: 10)
                        SectionHeader(title: "Career Matches",
                                      subtitle: "Paths shaped by how you think and learn.")
                        .padding(.horizontal, 20)
                        
                        VStack(spacing: 10) {
                            ForEach(careers, id: \.self) { career in
                                CareerMatchRow(title: career)
                            }
                        }
                        Spacer().frame(height: 30)
                        
                    }
                    .padding(.horizontal, 20)
                    .padding(.vertical, 10)
                    .background(navyShades[5])
                }
            }
            .background(Color.white.ignoresSafeArea())
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("For You")
                        .font(Font.custom("Poppins-Bold", size: 24))
                        .foregroundColor(.white)
                }
            }
            .toolbarBackground(Color(red: 0/255, green: 56/255, blue: 100/255).opacity(1), for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            .navigationBarTitleDisplayMode(.inline)
            .onAppear {
                data = ForYouController.shared.generateForYouData()
            }
        }
    }
}

#Preview {
    ForYouView()
}






//ui components

struct SectionHeader: View {
    var title: String
    var subtitle: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(title)
                .font(Font.custom("Poppins-Bold", size: 18))
            Text(subtitle)
                .font(Font.custom("Poppins-Regular", size: 12))
                .foregroundColor(.gray)
        }
    }
}

struct SmartSubjectCard: View {
    var subjects: [String]
    var color: Color
    
    var body: some View {
        VStack(spacing: 6) {
            ForEach(subjects, id: \.self) { subject in
                Text(subject)
                    .font(Font.custom("Poppins-Regular", size: 12))
                    .foregroundColor(.black)
                    .frame(width: 90, height: 45)
                    .multilineTextAlignment(.center)
                    .background(Color.white)
                    .cornerRadius(30)
                    .shadow(color: .gray.opacity(0.4), radius: 4, x: 0, y: 2)
            }
        }
        .frame(width: 110, height: 180)
        .background(color)
        .cornerRadius(30)
        .shadow(color: .gray.opacity(0.4), radius: 4, x: 0, y: 2)
    }
}

struct JourneyCard: View {
    var title: String
    
    var body: some View {
        Text(title)
            .font(Font.custom("Poppins-Regular", size: 12))
            .foregroundColor(.black)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding()
            .background(Color.white)
            .cornerRadius(30)
            .shadow(color: .gray.opacity(0.4), radius: 4, x: 0, y: 2)
    }
}

struct CourseCard: View {
    var title: String
    var color: Color
    
    var body: some View {
        Text(title)
            .font(Font.custom("Poppins-Regular", size: 12))
            .frame(width: 110, height: 100)
            .background(color)
            .cornerRadius(30)
            .shadow(color: .gray.opacity(0.4), radius: 4, x: 0, y: 2)
    }
}

struct CareerMatchRow: View {
    var title: String
    
    var body: some View {
        Text(title)
            .font(Font.custom("Poppins-Regular", size: 12))
            .frame(maxWidth: .infinity, minHeight: 30)
            .background(Color.white)
            .cornerRadius(30)
            .shadow(color: .gray.opacity(0.4), radius: 4, x: 0, y: 2)
    }
}

import SwiftUI

//interests
struct Interest: Identifiable, Codable, Equatable {
    var id = UUID()
    var name: String
    var imageName: String
    var isSelected: Bool = false
}

let defaultInterests: [Interest] = [
    Interest(name: "Science & Discovery", imageName: "Science"),
    Interest(name: "Business & Enterprise", imageName: "Business"),
    Interest(name: "Technology & Innovation", imageName: "Technology"),
    Interest(name: "Art & Design", imageName: "Art"),
    Interest(name: "Creative Thinking", imageName: "Creative thinking"),
    Interest(name: "Problem Solving & Logic", imageName: "Problem solving"),
    Interest(name: "Helping People & Communities", imageName: "Communities"),
    Interest(name: "Writing & Communication", imageName: "Writing"),
    Interest(name: "History, Culture & Society", imageName: "Business"),
    Interest(name: "Performance & Expression", imageName: "Business"),
    Interest(name: "Languages & Communication", imageName: "Business"),
    Interest(name: "Environment & Sustainability", imageName: "Business")
]


//skills3
struct Skill: Identifiable, Codable, Equatable {
    var id = UUID()
    var name: String
    var isSelected: Bool = false
}

let defaultSoftSkills: [Skill] = [
    "Adaptability", "Attention to detail", "Communication",
    "Conflict resolution", "Creativity", "Critical thinking",
    "Decision making", "Empathy", "Initiative", "Leadership",
    "Negotiation", "Organisation", "Problem-solving",
    "Public speaking", "Teamwork", "Time management"
].map { Skill(name: $0) }

let defaultHardSkills: [Skill] = [
    "Building / Making things", "Coding / Programming",
    "Data Analysis", "Editing & Media", "IT skills", "Lab skills",
    "Foreign languages", "Maths & Numbers", "Presentation",
    "Research", "Scientific thinking", "Statistics",
    "Technical drawing", "Visual design", "Writing"
].map { Skill(name: $0) }



//learning styles
struct LearningStyle: Identifiable, Codable, Equatable {
    var id = UUID()
    var name: String
    var imageName: String
    var isSelected: Bool = false
}

let defaultLearningStyles: [LearningStyle] = [
    LearningStyle(name: "Hands-on / Practical", imageName: "Practical"),
    LearningStyle(name: "Research-heavy", imageName: "Research-heavy"),
    LearningStyle(name: "Creative & Visual", imageName: "Creative"),
    LearningStyle(name: "Team-based", imageName: "Team-based"),
    LearningStyle(name: "Independent / Self-paced", imageName: "Independent"),
    LearningStyle(name: "Discussion-focused", imageName: "Discussion")
]



//study pref
struct StudyPreference: Identifiable, Codable, Equatable {
    var id = UUID()
    var name: String
    var imageName: String
    var isSelected: Bool = false
}

let defaultStudyPreferences: [StudyPreference] = [
    StudyPreference(name: "Chill & Manageable", imageName: "Chill"),
    StudyPreference(name: "Balanced Approach", imageName: "Balanced"),
    StudyPreference(name: "Push Myself", imageName: "Push myself")
]



//ambitions
struct Ambition: Identifiable, Codable, Equatable {
    var id = UUID()
    var name: String
    var isSelected: Bool = false
}


let defaultCareerAmbitions: [Ambition] = [
    Ambition(name: "Earn a high income"),
    Ambition(name: "Run my own business one day"),
    Ambition(name: "Go into healthcare or medicine"),
    Ambition(name: "Have a respected or prestigious career"),
    Ambition(name: "Lead or manage others"),
    Ambition(name: "Work with technology or innovation"),
    Ambition(name: "Solve complex problems")
]

let defaultLifestyleAmbitions: [Ambition] = [
    Ambition(name: "Travel and work globally"),
    Ambition(name: "Keep things low-stress and flexible"),
    Ambition(name: "Work outdoors or in nature"),
    Ambition(name: "Do something hands-on")
]

let defaultPersonalAmbitions: [Ambition] = [
    Ambition(name: "Make a positive impact"),
    Ambition(name: "Make a difference in my community"),
    Ambition(name: "Work with people"),
    Ambition(name: "Do something creative")
]

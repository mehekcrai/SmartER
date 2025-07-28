import Foundation

struct ForYouModel {
    var subjects: [[String]] = []
    var journeys: [String] = []
}

//subject database
struct SubjectDB {
    static let subjectsForInterest: [String: [String]] = [
        "Science & Discovery": ["Biology", "Chemistry", "Physics"],
        "Technology & Innovation": ["Computer Science", "Maths", "Further Maths"],
        "Business & Enterprise": ["Business Studies", "Economics", "Accounting"],
        "Art & Design": ["Art", "Graphic Design", "Media Studies"],
        "Creative Thinking": ["Drama", "Music", "Photography"],
        "Problem Solving & Logic": ["Maths", "Further Maths", "Physics"],
        "Helping People & Communities": ["Psychology", "Sociology", "Health & Social Care"],
        "Writing & Communication": ["English Language", "English Literature", "Media Studies"],
        "History, Culture & Society": ["History", "Politics", "Sociology"],
        "Languages & Communication": ["French", "Spanish", "German"],
        "Environment & Sustainability": ["Geography", "Environmental Science", "Biology"]
    ]
}

//story database
struct StoryDB {
    static let storyTags: [String: String] = [
        "Science & Discovery": "How A-level Biology prepared me for Medicine",
        "Technology & Innovation": "Why Computer Science changed my career path",
        "Business & Enterprise": "From A-level Economics to running my own business",
        "Art & Design": "Turning A-level Art into a career in Graphic Design",
        "Creative Thinking": "How Creative Thinking shaped my problem-solving skills",
        "Problem Solving & Logic": "Solving real-world issues through Physics and Maths",
        "Helping People & Communities": "How Sociology made me see the world differently",
        "Writing & Communication": "How English helped me land my first media job",
        "History, Culture & Society": "Studying History opened the doors to law",
        "Languages & Communication": "From A-level French to working abroad",
        "Environment & Sustainability": "Why I pursued Environmental Science"
    ]
}

import Foundation

class ForYouController {
    static let shared = ForYouController()
    
    //generate smart subjects and insightful journeys
    func generateForYouData() -> ForYouModel {
        let interests = ProfileController.shared.loadInterests().filter { $0.isSelected }
        
        var subjectSets: [[String]] = []
        for interest in interests {
            if let relatedSubjects = SubjectDB.subjectsForInterest[interest.name] {
                subjectSets.append(Array(relatedSubjects.prefix(3)))
            }
        }
        
        //
        if subjectSets.isEmpty {
            subjectSets = [["English Literature", "History", "Sociology"]]
        }
        while subjectSets.count < 5 {
            subjectSets.append(["Maths", "Business Studies", "Economics"])
        }
        
        var journeys: [String] = []
        for interest in interests {
            if let journey = StoryDB.storyTags[interest.name] {
                journeys.append(journey)
            }
        }
        
        if journeys.isEmpty {
            journeys = ["Explore real stories soon!"]
        }
        while journeys.count < 5 {
            journeys.append("Discover unique career paths")
        }
        
        return ForYouModel(subjects: Array(subjectSets.prefix(5)),
                           journeys: Array(journeys.prefix(5)))
    }
}

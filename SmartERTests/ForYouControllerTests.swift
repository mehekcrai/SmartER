import XCTest
@testable import SmartER

final class ForYouControllerTests: XCTestCase {

    //interests
    func testGenerateDataWithNoInterests() {
        ProfileController.shared = MockProfileController(interests: [])

        let result = ForYouController.shared.generateForYouData()
        
        XCTAssertEqual(result.subjects.count, 5)
        XCTAssertEqual(result.journeys.count, 5)
        XCTAssertEqual(result.subjects.first, ["English Literature", "History", "Sociology"])
        XCTAssertTrue(result.journeys.contains("Explore real stories soon!"))
    }
    
    func testGenerateDataWithValidInterests() {
        let interests = [
            Interest(name: "Science & Discovery", imageName: "", isSelected: true),
            Interest(name: "Technology & Innovation", imageName: "", isSelected: true)
        ]
        ProfileController.shared = MockProfileController(interests: interests)

        let result = ForYouController.shared.generateForYouData()

        XCTAssertEqual(result.subjects.count, 5)
        XCTAssertTrue(result.subjects[0].contains("Biology"))
        XCTAssertTrue(result.journeys.contains("How A-level Biology prepared me for Medicine"))
    }

    
    //skills
    func testSaveAndLoadSoftSkills() {
        let skills = [
            Skill(name: "Communication", isSelected: true),
            Skill(name: "Teamwork", isSelected: false)
        ]
        ProfileController.shared.saveSkills(soft: skills, hard: [])
        let loaded = ProfileController.shared.loadSoftSkills()
        XCTAssertEqual(loaded, skills)
    }
    
    func testSaveAndLoadHardSkills() {
        let skills = [
            Skill(name: "Programming", isSelected: true)
        ]
        ProfileController.shared.saveSkills(soft: [], hard: skills)
        let loaded = ProfileController.shared.loadHardSkills()
        XCTAssertEqual(loaded, skills)
    }

    //ambitions
    func testSaveAndLoadCareerAmbitions() {
        let ambitions = [
            Ambition(name: "Doctor", isSelected: true)
        ]
        ProfileController.shared.saveAmbitions(career: ambitions, lifestyle: [], personal: [])
        let loaded = ProfileController.shared.loadCareerAmbitions()
        XCTAssertEqual(loaded, ambitions)
    }
    
    func testSaveAndLoadLifestyleAmbitions() {
        let ambitions = [
            Ambition(name: "Travel the world", isSelected: true)
        ]
        ProfileController.shared.saveAmbitions(career: [], lifestyle: ambitions, personal: [])
        let loaded = ProfileController.shared.loadLifestyleAmbitions()
        XCTAssertEqual(loaded, ambitions)
    }
    
    func testSaveAndLoadPersonalAmbitions() {
        let ambitions = [
            Ambition(name: "Learn a new language", isSelected: true)
        ]
        ProfileController.shared.saveAmbitions(career: [], lifestyle: [], personal: ambitions)
        let loaded = ProfileController.shared.loadPersonalAmbitions()
        XCTAssertEqual(loaded, ambitions)
    }
    
    
    //learning styles
    func testSaveAndLoadLearningStyles() {
        let styles = [
            LearningStyle(name: "Visual", imageName: "", isSelected: true)
        ]
        ProfileController.shared.saveLearningStyles(styles)
        let loaded = ProfileController.shared.loadLearningStyles()
        XCTAssertEqual(loaded, styles)
    }

    //study pref
    func testSaveAndLoadStudyPreferences() {
        let prefs = [
            StudyPreference(name: "Quiet Space", imageName: "", isSelected: true)
        ]
        ProfileController.shared.saveStudyPreferences(prefs)
        let loaded = ProfileController.shared.loadStudyPreferences()
        XCTAssertEqual(loaded, prefs)
    }
    
}

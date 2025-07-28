import SwiftUI
import FirebaseAuth

extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
        _ = scanner.scanString("#")
        var rgb: UInt64 = 0
        scanner.scanHexInt64(&rgb)
        let r = Double((rgb >> 16) & 0xFF) / 255.0
        let g = Double((rgb >> 8) & 0xFF) / 255.0
        let b = Double(rgb & 0xFF) / 255.0
        self.init(red: r, green: g, blue: b)
    }
}

class ProfileController: ObservableObject {
    static var shared = ProfileController()
    
    //uid-based key- each user's data is separate
    private func userKey(_ key: String) -> String {
        if let user = Auth.auth().currentUser {
            return "\(user.uid)_\(key)"
        }
        return key
    }
    
    //generic save/load- default fyp (first-time users or unselected)
    private func saveSelections<T: Identifiable>(_ items: [T], key: String) where T: Codable {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(items) {
            UserDefaults.standard.set(encoded, forKey: key)
        }
    }
    
    private func loadSelections<T: Identifiable>(_ defaultItems: [T], key: String) -> [T] where T: Codable {
        if let savedData = UserDefaults.standard.data(forKey: key) {
            let decoder = JSONDecoder()
            if let decoded = try? decoder.decode([T].self, from: savedData) {
                return decoded
            }
        }
        return defaultItems
    }
    
    //interests
    func saveInterests(_ interests: [Interest]) {
        saveSelections(interests, key: userKey("SelectedInterests"))
    }
    
    func loadInterests() -> [Interest] {
        return loadSelections(defaultInterests, key: userKey("SelectedInterests"))
    }
    
    //skills
    func saveSkills(soft: [Skill], hard: [Skill]) {
        saveSelections(soft, key: userKey("SelectedSoftSkills"))
        saveSelections(hard, key: userKey("SelectedHardSkills"))
    }
    
    func loadSoftSkills() -> [Skill] {
        return loadSelections(defaultSoftSkills, key: userKey("SelectedSoftSkills"))
    }
    
    func loadHardSkills() -> [Skill] {
        return loadSelections(defaultHardSkills, key: userKey("SelectedHardSkills"))
    }
    
    //learning styles
    func saveLearningStyles(_ styles: [LearningStyle]) {
        saveSelections(styles, key: userKey("SelectedLearningStyles"))
    }
    
    func loadLearningStyles() -> [LearningStyle] {
        return loadSelections(defaultLearningStyles, key: userKey("SelectedLearningStyles"))
    }
    
    //study preferences
    func saveStudyPreferences(_ preferences: [StudyPreference]) {
        saveSelections(preferences, key: userKey("SelectedStudyPreferences"))
    }
    
    func loadStudyPreferences() -> [StudyPreference] {
        return loadSelections(defaultStudyPreferences, key: userKey("SelectedStudyPreferences"))
    }
    
    //ambitions
    func saveAmbitions(career: [Ambition], lifestyle: [Ambition], personal: [Ambition]) {
        saveSelections(career, key: userKey("SelectedCareerAmbitions"))
        saveSelections(lifestyle, key: userKey("SelectedLifestyleAmbitions"))
        saveSelections(personal, key: userKey("SelectedPersonalAmbitions"))
    }
    
    func loadCareerAmbitions() -> [Ambition] {
        return loadSelections(defaultCareerAmbitions, key: userKey("SelectedCareerAmbitions"))
    }
    
    func loadLifestyleAmbitions() -> [Ambition] {
        return loadSelections(defaultLifestyleAmbitions, key: userKey("SelectedLifestyleAmbitions"))
    }
    
    func loadPersonalAmbitions() -> [Ambition] {
        return loadSelections(defaultPersonalAmbitions, key: userKey("SelectedPersonalAmbitions"))
    }
}

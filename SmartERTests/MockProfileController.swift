import Foundation
@testable import SmartER

class MockProfileController: ProfileController {
    private var mockInterests: [Interest]
    
    init(interests: [Interest]) {
        self.mockInterests = interests
    }
    
    override func loadInterests() -> [Interest] {
        return mockInterests
    }
}


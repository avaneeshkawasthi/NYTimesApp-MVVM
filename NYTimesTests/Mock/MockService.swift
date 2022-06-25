

import Foundation
@testable import NYTimes

class MockService : ServiceProtocol {
    
    func fetchArticleList(periods: Periods, completion: @escaping ([Article]?) -> Void) {
        completion(mockData)
    }
    
    let mockData: [Article]?
    
    init(mockData: [Article]?) {
        self.mockData = mockData
    }
    
}

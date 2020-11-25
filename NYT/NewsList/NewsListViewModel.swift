

import Foundation
import UIKit

final class NewsListViewModel {
    
    // MARK: - Constants and Variables
    
    let serviceHelper = ServiceHelper.shared
    var rows = [Article]()
    var numberOfRows: Int { return rows.count }
    
    // MARK: - Fetch Data
    
    func fetchNewsData(completion: @escaping APIResult<Void>) {
        serviceHelper.fetchArticles() { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let data):
                self.rows = data.articles ?? []
                completion(.success(()))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}

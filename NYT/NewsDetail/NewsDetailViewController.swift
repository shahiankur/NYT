
import UIKit

// MARK: - News Detail View

final class NewsDetailViewController: UIViewController {
    
    // MARK: - IBOutlet
    
    @IBOutlet weak var newsDetailCollectionView: UICollectionView!
    
    // MARK: - Variable
    
    var viewModel: Article?
    
    // MARK: - Constants
    
    private enum Constants {
        static let numberOfSections = 2
        static let numberOfRowsInImageSection = 1
        static let numberOfRowsInDetailSection = 8
    }
    
    // MARK: - Life Cycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newsDetailCollectionView.backgroundColor = .nytGray
        self.title = NSLocalizedString("News Detail", comment: "News Detail screen title")
    }
}

// MARK: - UICollectionViewDataSource

extension NewsDetailViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return Constants.numberOfSections
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return Constants.numberOfRowsInImageSection
        }
        else {
            return Constants.numberOfRowsInDetailSection
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            let cell: NewsImageCollectionViewCell = collectionView.dequeueCell(for: indexPath)
            cell.configure(url: viewModel?.imageUrl ?? "")
            return cell
        }
        else {
            let cell: NewsDetailCollectionViewCell = collectionView.dequeueCell(for: indexPath)
            cell.configure(viewModel: viewModel!, row: indexPath.row)
            return cell
        }
    }
}

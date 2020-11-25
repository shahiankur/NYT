
import UIKit

final class NewsListViewController: UIViewController {
    
    // MARK: - IBOutelts
    
    @IBOutlet weak var newsListCollectionView: UICollectionView!
    
    // MARK: - Constants
    
    let viewModel = NewsListViewModel()
    
    // MARK: - Life Cycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.title = NSLocalizedString("News", comment: "News Home screen title")
        newsListCollectionView.backgroundColor = .nytGray
        getNewsData()
    }
    
    // MARK: - Fetch Data
    
    private func getNewsData() {
        self.viewModel.fetchNewsData() { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success:
                self.newsListCollectionView.reloadData()
            case .failure:
                let alert = UIAlertController(title: "New York Times", message: NSLocalizedString("Failed To Fetch News. Please try again.", comment: "News List API failed"), preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
        }
    }
}

// MARK: - UICollectionViewDataSource

extension NewsListViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfRows
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: NewsListCollectionViewCell = collectionView.dequeueCell(for: indexPath)
        cell.configure(viewModel: viewModel.rows[indexPath.row])
        return cell
    }
}

// MARK: - UICollectionViewDelegate

extension NewsListViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "NewsDetail", bundle:nil)
        let newsDetailViewController = storyBoard.instantiateViewController(withIdentifier: "NewsDetailViewController") as! NewsDetailViewController
        newsDetailViewController.viewModel = viewModel.rows[indexPath.row]
        self.navigationController?.pushViewController(newsDetailViewController, animated: true)
    }
}

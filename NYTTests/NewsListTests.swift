//
//  NewsListTests.swift
//  NYTTests
//
//  Created by Shahi, Ankur EX1 on 24/11/20.
//

import XCTest
@testable import NYT

class NewsListTests: XCTestCase {
    
    var newsData: NewsData!
    var systemUnderTest: NewsListViewController!
    
    override func setUp() {
        super.setUp()
        if let path = Bundle.main.path(forResource: "ResponseStub", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
                if let jsonResult = jsonResult as? Dictionary<String, AnyObject>, let person = jsonResult["results"] as? [[String: Any]]  {
                    let articles = person.map({ Article(articleDict: $0)}).compactMap{$0}
                    newsData = NewsData(articles: articles)
                }
            } catch {
                /* Handle if required*/
            }
        }
        
        //get the storyboard the ViewController under test is inside
        let storyboard: UIStoryboard = UIStoryboard(name: "NewsList", bundle: nil)
        
        //get the ViewController we want to test from the storyboard (note the identifier is the id explicitly set in the identity inspector)
        systemUnderTest = storyboard.instantiateViewController(withIdentifier: "NewsListViewController") as! NewsListViewController
        //load view hierarchy
        _ = systemUnderTest.view
    }
    
    func testData() {
        let viewModel = NewsListViewModel()
        viewModel.rows = newsData?.articles ?? []
        XCTAssertEqual(viewModel.numberOfRows, 20)
    }
    
    
    func testSUT_CanInstantiateViewController() {
        XCTAssertNotNil(systemUnderTest)
    }
    
    func testSUT_CollectionViewIsNotNilAfterViewDidLoad() {
        XCTAssertNotNil(systemUnderTest.newsListCollectionView)
    }
    
    func testSUT_ShouldSetCollectionViewDataSource() {
        XCTAssertNotNil(systemUnderTest.newsListCollectionView.dataSource)
    }
    
    func testSUT_ConformsToCollectionViewDataSource() {
        XCTAssert(NewsListViewController.conforms(to: UICollectionViewDataSource.self))
        XCTAssertTrue(systemUnderTest.responds(to: #selector(systemUnderTest.collectionView(_:numberOfItemsInSection:))))
        XCTAssertTrue(systemUnderTest.responds(to: #selector(systemUnderTest.collectionView(_:cellForItemAt:))))
    }
    
    func testSUT_ShouldSetCollectionViewDelegate() {
        XCTAssertNotNil(systemUnderTest.newsListCollectionView.delegate)
    }
    
    func testSUT_ConformsToCollectionViewDelegate() {
        XCTAssert(NewsListViewController.conforms(to: UICollectionViewDelegate.self))
        XCTAssertTrue(systemUnderTest.responds(to: #selector(systemUnderTest.collectionView(_:didSelectItemAt:))))
    }
    
    func testSUT_ConformsToCollectionViewDelegateFlowLayout () {
        XCTAssertFalse(NewsListViewController.conforms(to: UICollectionViewDelegateFlowLayout.self))
    }
}

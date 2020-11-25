//
//  NewsDetailTests.swift
//  NYTTests
//
//  Created by Shahi, Ankur EX1 on 25/11/20.
//

import XCTest
@testable import NYT

class NewsDetailTests: XCTestCase {
    
    var systemUnderTest: NewsDetailViewController!
    override func setUp() {
        
        //get the storyboard the ViewController under test is inside
        let storyboard: UIStoryboard = UIStoryboard(name: "NewsDetail", bundle: nil)
        
        //get the ViewController we want to test from the storyboard (note the identifier is the id explicitly set in the identity inspector)
        systemUnderTest = storyboard.instantiateViewController(withIdentifier: "NewsDetailViewController") as! NewsDetailViewController
        //load view hierarchy
        _ = systemUnderTest.view
        
    }
    
    func testSUT_CanInstantiateViewController() {
        XCTAssertNotNil(systemUnderTest)
    }
    
    func testSUT_CollectionViewIsNotNilAfterViewDidLoad() {
        XCTAssertNotNil(systemUnderTest.newsDetailCollectionView)
    }
    
    func testSUT_ShouldSetCollectionViewDataSource() {
        XCTAssertNotNil(systemUnderTest.newsDetailCollectionView.dataSource)
    }
    
    func testSUT_ConformsToCollectionViewDataSource() {
        XCTAssert(NewsListViewController.conforms(to: UICollectionViewDataSource.self))
        XCTAssertTrue(systemUnderTest.responds(to: #selector(systemUnderTest.collectionView(_:numberOfItemsInSection:))))
        XCTAssertTrue(systemUnderTest.responds(to: #selector(systemUnderTest.collectionView(_:cellForItemAt:))))
    }
    
    func testSUT_ShouldSetCollectionViewDelegate() {
        XCTAssertNotNil(systemUnderTest.newsDetailCollectionView.delegate)
    }
    
    func testSUT_ConformsToCollectionViewDelegate() {
        XCTAssert(NewsListViewController.conforms(to: UICollectionViewDelegate.self))
    }
    
    func testSUT_ConformsToCollectionViewDelegateFlowLayout () {
        XCTAssertFalse(NewsListViewController.conforms(to: UICollectionViewDelegateFlowLayout.self))
    }
    
    
    
}

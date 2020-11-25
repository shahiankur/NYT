//
//  NewsListUITests.swift
//  NYTUITests
//
//  Created by Shahi, Ankur EX1 on 24/11/20.
//

import XCTest

//@testable import NYT

class NewsListUITests: XCTestCase {
    func testNewsListScreen(){
        let app = XCUIApplication()
        app.launch()
        app.collectionViews.cells.element(boundBy:0).tap()
        let newsButton = app.navigationBars["News Detail"].buttons["News"]
        newsButton.tap()
    }
}

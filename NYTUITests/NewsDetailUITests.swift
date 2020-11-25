//
//  NewsDetailUITests.swift
//  NYTUITests
//
//  Created by Shahi, Ankur EX1 on 25/11/20.
//

import XCTest

class NewsDetailUITests: XCTestCase {
    
    func testNewsDetail() {
        let app = XCUIApplication()
        app.launch()
        app.collectionViews.cells.element(boundBy:0).tap()
        let collectionViewsQuery = app.collectionViews
        collectionViewsQuery.children(matching: .cell).element(boundBy: 0).children(matching: .other).element.swipeDown()
        app.navigationBars["News Detail"].buttons["News"].tap()
    }
}

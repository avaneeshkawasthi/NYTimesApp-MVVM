//
//  ArticleListDataSourceTest.swift
//  NYTimesTests
//
//  Created by Avaneesh on 25/06/22.
//

import XCTest
@testable import NYTimes

class ArticleListDataSourceTest: XCTestCase {
    
    func testEmptyValueInDataSource() {
          
        let expectedList : Array<Article> = []
        let service = MockService(mockData: (expectedList))
        let viewModel = ArticlesViewModel(service: service)
        let tableView = UITableView()
        tableView.dataSource = viewModel
        
        viewModel.loadData(finished: {
                    
          // expected zero cells
            XCTAssertEqual(tableView.dataSource?.tableView(tableView, numberOfRowsInSection: 0), 0, "Expected no cell in table view")
        })
      }

    func testValueInDataSource() {
        let expectedList = [Article.with()!]
        let service = MockService(mockData: (expectedList))
        let viewModel = ArticlesViewModel(service: service)
        let tableView = UITableView()
        tableView.dataSource = viewModel
        
        viewModel.loadData(finished: {
            
            // expected one cell
            XCTAssertEqual(tableView.dataSource!.tableView(tableView, numberOfRowsInSection: 0), 1, "Expected one cell in table view")

        })
    }



}

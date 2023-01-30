//
//  ContentViewModelTest.swift
//  UserListAppTests
//
//  Created by Sena Kurtak on 30.01.2023.
//

import XCTest
@testable import UserListApp

final class ContentViewModelTests : XCTestCase{
    
    private var viewModel : ContentViewModel!
    
    // will run at each test function
    override func setUp() {
        super.setUp()
        viewModel = .init()
    }
    // will be into teardown at each test function end
    override class func tearDown() {
        super.tearDown()
    }
    
    func test_restApi_EqualUserList(){
        viewModel.restapiRead(tableView: <#T##UITableView#>)
    }
}

//
//  MainViewControllerTests.swift
//  AlertsAndPresentationUnitTestingTests
//
//  Created by Hossam Ghareeb on 07/01/2021.
//

import XCTest
@testable import AlertsAndPresentationUnitTesting

class MainViewControllerTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testMainViewController_outletsConnectedCorrectly() throws {
        
        let vc = MainViewController.fromStoryboard()
        vc.loadViewIfNeeded()
        
        XCTAssertNotNil(vc.showAlert1Button)
        XCTAssertNotNil(vc.showAlert2Button)
    }
    
    func testMainViewController_button1_showsAlert1() throws {
        let vc = MainViewController.fromStoryboard()
        vc.loadViewIfNeeded()
        
        // when
        vc.showAlert1Button.tap()
        
        // then
        
    }

}


extension UIButton {
    func tap() {
        sendActions(for: .touchUpInside)
    }
}

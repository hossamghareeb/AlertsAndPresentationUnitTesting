//
//  MainViewControllerTests.swift
//  AlertsAndPresentationUnitTestingTests
//
//  Created by Hossam Ghareeb on 07/01/2021.
//

import XCTest
@testable import AlertsAndPresentationUnitTesting
import ViewControllerPresentationSpy

class MainViewControllerTests: XCTestCase {
    
    private var alertVerifier: AlertVerifier!

    override func setUpWithError() throws {
        alertVerifier = AlertVerifier()
    }

    override func tearDownWithError() throws {
        alertVerifier = nil
    }

    func testMainViewController_outletsConnectedCorrectly() throws {
        
        let vc = MainViewController.fromStoryboard()
        vc.loadViewIfNeeded()
        
        XCTAssertNotNil(vc.showAlert1Button)
        XCTAssertNotNil(vc.showAlert2Button)
    }
    
    func testMainViewController_button1_shouldShowAlert1() throws {
        let vc = MainViewController.fromStoryboard()
        vc.loadViewIfNeeded()
        
        // when
        vc.showAlert1Button.tap()
        
        // then
        alertVerifier.verify(title: "Alert 1",
                             message: "Message 1",
                             animated: true,
                             actions: [.default("Action 1"), .default("Action 2")],
                             preferredStyle: .alert,
                             presentingViewController: vc)
        
    }
    
    func testMainViewController_button2_shouldShowAlert2() throws {
        let vc = MainViewController.fromStoryboard()
        vc.loadViewIfNeeded()
        
        // when
        vc.showAlert2Button.tap()
        
        // then
        alertVerifier.verify(title: "Alert 2",
                             message: "Message 2",
                             animated: true,
                             actions: [.default("Action 1"), .default("Action 2")],
                             preferredStyle: .alert,
                             presentingViewController: vc)
        
    }

}


extension UIButton {
    func tap() {
        sendActions(for: .touchUpInside)
    }
}

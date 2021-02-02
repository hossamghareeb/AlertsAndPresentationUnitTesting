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

    func testMainViewController_outletsConnectedCorrectly() throws {
        
        let vc = MainViewController.fromStoryboard()
        vc.loadViewIfNeeded()
        
        XCTAssertNotNil(vc.showAlert1Button)
        XCTAssertNotNil(vc.showAlert2Button)
        XCTAssertNotNil(vc.pushButton)
    }
    
    func testMainViewController_button1_shouldShowAlert1() throws {
        let alertVerifier = AlertVerifier()
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
        let alertVerifier = AlertVerifier()
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
    
    func testMainViewController_tappingPushButton_shouldPushSecondVC() {
        let vc = MainViewController.fromStoryboard()
        vc.loadViewIfNeeded()
        let navVC = UINavigationController(rootViewController: vc)
        
        vc.pushButton.tap()
        
        // when you deal with animation, push, and present, use this to force runloop to execute
        // and push will take effect immediately
        RunLoop.current.run(until: Date())
        
        // then
        XCTAssertEqual(navVC.viewControllers.count, 2)
        let lastVC = navVC.viewControllers.last
        guard let _ = lastVC as? SecondViewController else {
            return XCTFail("Expected SecondViewController but was \(String(describing: lastVC))")
        }
    }
    
    func testMainViewController_tappingPushButton_shouldPushSecondVCWithAnimation() {
        let vc = MainViewController.fromStoryboard()
        vc.loadViewIfNeeded()
        let navVC = SpyNavigationController(rootViewController: vc)
        
        vc.pushButton.tap()
        
        // when you deal with animation, push, and present, use this to force runloop to execute
        // and push will take effect immediately
        RunLoop.current.run(until: Date())
        
        // then
        XCTAssertEqual(navVC.viewControllers.count, 2)
        let lastVC = navVC.viewControllers.last
        guard let _ = lastVC as? SecondViewController else {
            return XCTFail("Expected SecondViewController but was \(String(describing: lastVC))")
        }
        
        // test animated property
        XCTAssertTrue(navVC.animatedFlags.last!)
    }

    func testMainViewController_tappingPresentButton_shouldPresentSecondVC() {
        let verifier = PresentationVerifier()
        let vc = MainViewController.fromStoryboard()
        vc.loadViewIfNeeded()
        
        vc.presentButton.tap()
        
        let presentVC: SecondViewController? = verifier.verify(animated: true, presentingViewController: vc)
        print(presentVC)
    }
}


extension UIButton {
    func tap() {
        sendActions(for: .touchUpInside)
    }
}

class SpyNavigationController: UINavigationController {
    
    var animatedFlags: [Bool] = []
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        animatedFlags.append(animated)
        super.pushViewController(viewController, animated: animated)
    }
}

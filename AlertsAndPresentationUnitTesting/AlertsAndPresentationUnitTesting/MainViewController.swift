//
//  ViewController.swift
//  AlertsAndPresentationUnitTesting
//
//  Created by Hossam Ghareeb on 07/01/2021.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet private(set) weak var showAlert1Button: UIButton!
    @IBOutlet private(set) weak var showAlert2Button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func didTapShowAlert1(_ sender: Any) {
        print("presenting alert 1")
        let alertController = UIAlertController(title: "Alert 1", message: "Message 1", preferredStyle: .alert)
        let action1 = UIAlertAction(title: "Action 1", style: .default, handler: nil)
        let action2 = UIAlertAction(title: "Action 2", style: .default, handler: nil)
        [action1, action2].forEach { alertController.addAction($0) }
        alertController.preferredAction = action2
        present(alertController, animated: true)
    }
    
    @IBAction func didTapShowAlert2(_ sender: Any) {
        print("presenting alert 2")
        let alertController = UIAlertController(title: "Alert 2", message: "Message 2", preferredStyle: .alert)
        let action1 = UIAlertAction(title: "Action 1", style: .default, handler: nil)
        let action2 = UIAlertAction(title: "Action 2", style: .default, handler: nil)
        [action1, action2].forEach { alertController.addAction($0) }
        alertController.preferredAction = action2
        present(alertController, animated: true)
    }
    
}


//
//  UIViewController+Storyboard.swift
//  AlertsAndPresentationUnitTesting
//
//  Created by Hossam Ghareeb on 07/01/2021.
//

import UIKit

extension UIViewController {
    
    static func fromStoryboard() -> Self {
        let name = String(describing: Self.self)
        let sb = UIStoryboard(name: name, bundle: nil)
        return sb.instantiateViewController(identifier: name) as! Self
    }
}

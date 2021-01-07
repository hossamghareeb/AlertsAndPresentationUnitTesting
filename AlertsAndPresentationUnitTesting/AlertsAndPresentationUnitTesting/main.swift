//
//  main.swift
//  AlertsAndPresentationUnitTesting
//
//  Created by Hossam Ghareeb on 07/01/2021.
//

import UIKit

let appDelegateClass: AnyClass = NSClassFromString("UnitTestingAppDelegate") ?? AppDelegate.self

UIApplicationMain(CommandLine.argc, CommandLine.unsafeArgv, nil, NSStringFromClass(appDelegateClass))

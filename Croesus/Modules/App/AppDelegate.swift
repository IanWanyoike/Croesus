//
//  AppDelegate.swift
//  Croesus
//
//  Created by Ian Wanyoike on 01/02/2020.
//  Copyright © 2020 Pocket Pot. All rights reserved.
//

import UIKit
import RxSwift
import Firebase
import os.log

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    private var appCoordinator: AppCoordinator?
    private let disposeBag = DisposeBag()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        self.window = UIWindow()

        guard let window = self.window else { return false }

        UITextField.appearance().tintColor = .themeColor

        FirebaseApp.configure()

        let serviceLocator = ServiceLocator()
        serviceLocator.registerServices()

        self.appCoordinator = AppCoordinator(window: window, serviceLocator: serviceLocator)
        self.appCoordinator?.start().subscribe().disposed(by: self.disposeBag)

        return true
    }
}

//
//  AppDelegate.swift
//  BodyweightRoutine
//
//  Created by gary on 18/12/2018.
//  Copyright © 2018 Gary Kerr. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    private var coordinator: AppCoordinator!

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let exerciseDatabase = ExerciseDatabase()
        coordinator = AppCoordinator(exerciseDatabase: exerciseDatabase)
        coordinator.start()
        return true
    }
}


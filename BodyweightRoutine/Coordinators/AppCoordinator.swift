//
//  AppCoordinator.swift
//  BodyweightRoutine
//
//  Created by gary on 19/12/2018.
//  Copyright © 2018 Gary Kerr. All rights reserved.
//

import Foundation
import MessageUI
import UIKit

final class AppCoordinator: NSObject {
    private let window: UIWindow
    private var exerciseDatabase: ExerciseDatabase

    init(exerciseDatabase: ExerciseDatabase) {
        self.window = UIWindow()
        self.exerciseDatabase = exerciseDatabase
    }


    func start() {
        let introVC = IntroVC.make(delegate: self)
        window.rootViewController = introVC
        window.makeKeyAndVisible()
    }
}


// MARK: - IntroDelegate

extension AppCoordinator: IntroDelegate {
    func didStart(_ vc: IntroVC) {
        let pages = PagesVC.make(with: exerciseDatabase.routine, delegate: self)
        vc.present(pages, animated: true, completion: nil)
    }

    func about(_ vc: IntroVC) {
        let aboutVC = AboutVC.make(delegate: self)
        vc.present(aboutVC, animated: true, completion: nil)
    }
}


// MARK: - PagesDelegate

extension AppCoordinator: PagesDelegate {
    func showTimer(_ vc: ExerciseVC, exercise: Exercise) {
        print("show timer", exercise)
        TimerVC.present(for: vc, with: exercise)
    }

    func didCancel(_ vc: PagesVC) {
        vc.dismiss(animated: true, completion: nil)
    }
}


// MARK: - AboutDelegate

extension AppCoordinator: AboutDelegate {
    func contactMe(_ vc: AboutVC) {
        if !MFMailComposeViewController.canSendMail() {
            // show alert
            return
        }
        let mail = MFMailComposeViewController.init()
        mail.setSubject("Body weight routine app")
        mail.setToRecipients(["garykerrwork@gmail.com"])
        mail.mailComposeDelegate = self
        vc.present(mail, animated: true, completion: nil)
    }


    func viewRedditPost(_ vc: AboutVC) {
        let url = URL(string: "https://www.reddit.com/r/bodyweightfitness/comments/a09852/a_15_minutes_bodyweight_routine_for_posture_and/")!
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }


    func done(_ vc: AboutVC) {
        vc.dismiss(animated: true, completion: nil)
    }
}


// MARK: - MFMailComposeViewControllerDelegate

extension AppCoordinator: MFMailComposeViewControllerDelegate {
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }
}

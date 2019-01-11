//
//  TimerVC.swift
//  BodyweightRoutine
//
//  Created by gary on 11/01/2019.
//  Copyright © 2019 Gary Kerr. All rights reserved.
//

import UIKit

class TimerVC: UIViewController {

    private static let storyboardName = "Timers"
    private static let identifier = "TimerVC"

    @IBOutlet weak var timerLabel: UILabel!

    private var presentr: Presentr?
    private var exercise: Exercise!
    private var timer: ExerciseTimer?

    override func viewDidLoad() {
        super.viewDidLoad()
    }


    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.timer = ExerciseTimer(exercise: exercise, delegate: self)
        self.timer?.start()
    }


    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.timer?.end()
    }


    // MARK: - Actions

    @IBAction func dismiss(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}


// MARK: - Static

extension TimerVC {
    static func make() -> TimerVC {
        let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: identifier) as! TimerVC
        return vc
    }


    static func present(for vc: UIViewController, with exercise: Exercise) {
        let timerVC = TimerVC.make()
        let presentr = Presentr(presentationType: .bottomHalf)
        presentr.dismissOnSwipe = true
        presentr.dismissOnSwipeDirection = .bottom
        timerVC.presentr = presentr
        timerVC.exercise = exercise
        vc.customPresentViewController(presentr, viewController: timerVC, animated: true)
    }
}


// MARK: - ExerciseTimerDelegate

extension TimerVC: ExerciseTimerDelegate {
    func update(_ exerciseTimer: ExerciseTimer, text: String) {
        timerLabel.text = text
    }

    func done(_ exerciseTimer: ExerciseTimer) {
        dismiss(animated: true, completion: nil)
    }
}

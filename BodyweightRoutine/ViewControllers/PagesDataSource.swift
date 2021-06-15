//
//  PagesDataSource.swift
//  BodyweightRoutine
//
//  Created by gary on 19/12/2018.
//  Copyright © 2018 Gary Kerr. All rights reserved.
//

import Foundation
import UIKit
import Pageboy

final class PagesDataSource {
    private let routine: Routine
    private lazy var exercises = makeExercises()
    private weak var vc: UIViewController?
    private weak var delegate: PagesDelegate?
    private lazy var pages = makePages()


    init(routine: Routine, vc: UIViewController, delegate: PagesDelegate?) {
        self.routine = routine
        self.vc = vc
        self.delegate = delegate
    }
}


// MARK: - Helpers

extension PagesDataSource {
    var initialTitle: String {
        return exercises[0].group
    }
}


// MARK: - PageboyViewControllerDataSource

extension PagesDataSource: PageboyViewControllerDataSource {
    func numberOfViewControllers(in pageboyViewController: PageboyViewController) -> Int {
        return routine.exerciseCount
    }


    func viewController(for pageboyViewController: PageboyViewController, at index: PageboyViewController.PageIndex) -> UIViewController? {
        return pages[index]
    }


    func defaultPage(for pageboyViewController: PageboyViewController) -> PageboyViewController.Page? {
        return PageboyViewController.Page.first
    }
}


extension PagesDataSource: PageboyViewControllerDelegate {
    func pageboyViewController(_ pageboyViewController: PageboyViewController, willScrollToPageAt index: PageboyViewController.PageIndex, direction: PageboyViewController.NavigationDirection, animated: Bool) {

    }

    func pageboyViewController(_ pageboyViewController: PageboyViewController, didScrollTo position: CGPoint, direction: PageboyViewController.NavigationDirection, animated: Bool) {

    }

    func pageboyViewController(_ pageboyViewController: PageboyViewController, didScrollToPageAt index: PageboyViewController.PageIndex, direction: PageboyViewController.NavigationDirection, animated: Bool) {
        let exercise = exercises[index]
        vc?.title = exercise.group
    }

    func pageboyViewController(_ pageboyViewController: PageboyViewController, didReloadWith currentViewController: UIViewController, currentPageIndex: PageboyViewController.PageIndex) {
    }
}


// MARK: - Private

private extension PagesDataSource {
    func makeExercises() -> [ExerciseDataSource] {
        var exercises: [ExerciseDataSource] = []
        for group in routine.groups {
            for (n, exercise) in group.exercises.enumerated() {
                let dataSource = ExerciseDataSource(n: n + 1, exercise: exercise, exerciseGroup: group)
                exercises.append(dataSource)
            }
        }
        return exercises
    }


    func makePages() -> [UIViewController] {
        var pages: [UIViewController] = []
        for exercise in exercises {
            let vc = ExerciseVC.make(with: exercise, delegate: delegate)
            pages.append(vc)
        }
        return pages
    }
}

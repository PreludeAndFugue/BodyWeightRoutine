//
//  ViewController.swift
//  BodyweightRoutine
//
//  Created by gary on 18/12/2018.
//  Copyright © 2018 Gary Kerr. All rights reserved.
//

import UIKit

protocol PagesDelegate: AnyObject {
    func didCancel(_ vc: PagesVC)
    func showTimer(_ vc: ExerciseVC, exercise: Exercise)
}

class PagesVC: PageboyViewController {

    private static let storyboardName = "Main"
    private static let identifier = "PagesNC"

    private weak var vcDelegate: PagesDelegate?
    private var routine: Routine!
    private lazy var pagesDataSource = { PagesDataSource(routine: routine, vc: self, delegate: vcDelegate) }()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        self.dataSource = pagesDataSource
        self.delegate = pagesDataSource
    }

    // MARK: - Actions

    @IBAction func didCancel(_ sender: Any) {
        vcDelegate?.didCancel(self)
    }
}


// MARK: - Static

extension PagesVC {
    static func make(with routine: Routine, delegate: PagesDelegate) -> UIViewController {
        let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
        let nc = storyboard.instantiateViewController(withIdentifier: identifier) as! UINavigationController
        let vc = nc.viewControllers.first as! PagesVC
        vc.routine = routine
        vc.vcDelegate = delegate
        return nc
    }
}


// MARK: - Private

private extension PagesVC {
    func configureUI() {
        title = pagesDataSource.initialTitle
    }
}

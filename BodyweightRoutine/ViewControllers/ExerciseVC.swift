//
//  ExerciseVC.swift
//  BodyweightRoutine
//
//  Created by gary on 19/12/2018.
//  Copyright © 2018 Gary Kerr. All rights reserved.
//

import UIKit

class ExerciseVC: UIViewController {

    private static let storyboardName = "Exercise"
    private static let identifier = "ExerciseVC"

    private var dataSource: ExerciseDataSource!
    private weak var delegate: PagesDelegate?


    // MARK: - IBOutlets
    @IBOutlet weak var exerciseTitle: UILabel!
    @IBOutlet weak var exerciseRepetitions: UILabel!
    @IBOutlet weak var exerciseDescription: UILabel!
    @IBOutlet weak var exerciseCorrection: UILabel!
    @IBOutlet weak var exerciseImage: UIImageView!


    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }


    // MARK: - Actions

    @IBAction func showTimer(_ sender: Any) {
        delegate?.showTimer(self, exercise: dataSource.exercise)
    }
}


// MARK: - Static

extension ExerciseVC {
    static func make(with dataSource: ExerciseDataSource, delegate: PagesDelegate?) -> UIViewController {
        let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
        let vc = storyboard.instantiateInitialViewController() as! ExerciseVC
        vc.dataSource = dataSource
        vc.delegate = delegate
        return vc
    }
}


// MARK: - Private

private extension ExerciseVC {
    func configureUI() {
        exerciseTitle.text = dataSource.title
        exerciseRepetitions.text = dataSource.repetitions
        exerciseDescription.text = dataSource.description
        exerciseCorrection.text = dataSource.correction
        exerciseImage.image = dataSource.image
    }
}

//
//  ExerciseDataSource.swift
//  BodyweightRoutine
//
//  Created by gary on 19/12/2018.
//  Copyright © 2018 Gary Kerr. All rights reserved.
//

import Foundation
import UIKit

struct ExerciseDataSource {
    private let n: Int
    let exercise: Exercise
    private let exerciseGroup: ExerciseGroup


    init(n: Int, exercise: Exercise, exerciseGroup: ExerciseGroup) {
        self.exercise = exercise
        self.exerciseGroup = exerciseGroup
        self.n = n
    }
}


// MARK: - Public

extension ExerciseDataSource {
    var title: String {
        return exercise.name
    }

    var repetitions: String {
        return exercise.repetitions.description
    }

    var description: String {
        return exercise.description
    }

    var correction: String {
        return exercise.correction ?? "N/A"
    }

    var group: String {
        return "\(exerciseGroup.title): \(n) of \(exerciseGroup.count)"
    }

    var image: UIImage? {
        return UIImage(named: exercise.imageName)
    }
}

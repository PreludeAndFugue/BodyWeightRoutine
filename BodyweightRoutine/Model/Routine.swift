//
//  Routine.swift
//  BodyweightRoutine
//
//  Created by gary on 19/12/2018.
//  Copyright © 2018 Gary Kerr. All rights reserved.
//

import Foundation

struct Routine {
    let groups: [ExerciseGroup]

    init(groups: [ExerciseGroup]) {
        self.groups = groups
    }
}


// MARK: - Public

extension Routine {
    var exerciseCount: Int {
        return groups.map({ $0.exercises.count }).reduce(0, +)
    }


    func exercise(atIndex index: Int) -> Exercise {
        return groups.flatMap({ $0.exercises })[index]
    }
}

//
//  ExerciseGroup.swift
//  BodyweightRoutine
//
//  Created by gary on 19/12/2018.
//  Copyright © 2018 Gary Kerr. All rights reserved.
//

import Foundation

struct ExerciseGroup {
    let title: String
    let exercises: [Exercise]
}


// MARK: - Public {

extension ExerciseGroup {
    var count: Int {
        return exercises.count
    }
}

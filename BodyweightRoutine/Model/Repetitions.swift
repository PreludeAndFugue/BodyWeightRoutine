//
//  Repetitions.swift
//  BodyweightRoutine
//
//  Created by gary on 18/12/2018.
//  Copyright © 2018 Gary Kerr. All rights reserved.
//

import Foundation

enum Repetitions {
    case repetitions(Int)
    case repetitionsPerSide(Int)
    case seconds(Int)
    case secondsPerSide(Int)
}


extension Repetitions {
    var description: String {
        switch self {
        case .repetitions(let count):
            return "\(count) repetitions"
        case .repetitionsPerSide(let count):
            return "\(count) repetitions per side"
        case .seconds(let count):
            return "\(count) seconds"
        case .secondsPerSide(let count):
            return "\(count) seconds per side"
        }
    }
}

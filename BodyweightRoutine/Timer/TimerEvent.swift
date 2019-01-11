//
//  TimerEvent.swift
//  BodyweightRoutine
//
//  Created by gary on 11/01/2019.
//  Copyright © 2019 Gary Kerr. All rights reserved.
//

import Foundation

enum TimerEventType {
    case blank
    case ready
    case start
    case swapSide
}

struct TimerEvent {
    let text: String
    let type: TimerEventType
}

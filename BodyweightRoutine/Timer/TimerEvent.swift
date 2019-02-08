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


extension TimerEventType {
    var sound: URL? {
        switch self {
        case .blank, .swapSide: return nil
        case .ready:
            return Bundle.main.url(forResource: "ShortBeep", withExtension: "wav")!
        case .start:
            return Bundle.main.url(forResource: "LongBeep", withExtension: "wav")!
        }
    }
}


struct TimerEvent {
    let text: String
    let type: TimerEventType
}

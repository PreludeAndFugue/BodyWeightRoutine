//
//  ExerciseTimer.swift
//  BodyweightRoutine
//
//  Created by gary on 11/01/2019.
//  Copyright © 2019 Gary Kerr. All rights reserved.
//

import Foundation

typealias ExerciseTimerUpdater = (String) -> Void

protocol ExerciseTimerDelegate: class {
    func update(_ exerciseTimer: ExerciseTimer, text: String)
    func done(_ exerciseTimer: ExerciseTimer)
}


final class ExerciseTimer {
    private let exercise: Exercise
    private weak var delegate: ExerciseTimerDelegate?
    private lazy var events = makeEvents()
    private var timer: Timer?
    private var count: Int

    init(exercise: Exercise, delegate: ExerciseTimerDelegate) {
        self.count = 0
        self.exercise = exercise
        self.delegate = delegate
    }
}


// MARK: - Public API

extension ExerciseTimer {
    func start() {
        self.timer = makeTimer()
    }


    func end() {
        timer?.invalidate()
    }
}


// MARK: - Event creation helpers

private extension ExerciseTimer {
    func makeEvents() -> [TimerEvent] {
        switch exercise.repetitions {
        case .repetitions(let count):
            return makeRepetitionEvents(withCount: count)
        case .repetitionsPerSide(let count):
            return makeRepetitionEventsForEachSide(withCount: count)
        case .seconds(let seconds):
            return makeRepetitionEvents(withCount: seconds)
        case .secondsPerSide(let seconds):
            return makeRepetitionEventsForEachSide(withCount: seconds)
        }
    }


    func makeRepetitionEvents(withCount count: Int) -> [TimerEvent] {
        var events: [TimerEvent] = []
        events.append(contentsOf: countDownEvents)
        events.append(startEvent)
        events.append(contentsOf: makeEvents(withCount: count))
        return events
    }


    func makeRepetitionEventsForEachSide(withCount count: Int) -> [TimerEvent] {
        var events: [TimerEvent] = []
        events.append(contentsOf: countDownEvents)
        events.append(startEvent)
        events.append(contentsOf: makeEvents(withCount: count))
        events.append(TimerEvent(text: "0", type: .swapSide))
        events.append(contentsOf: makeEvents(withCount: count))
        return events
    }


    func makeEvents(withCount count: Int) -> [TimerEvent] {
        var events: [TimerEvent] = []
        for i in 1...count {
            let event = TimerEvent(text: String(i), type: .blank)
            events.append(event)
        }
        return events
    }


    var countDownEvents: [TimerEvent] {
        var events: [TimerEvent] = []
        for i in (1...3).reversed() {
            let event = TimerEvent(text: String(i), type: .ready)
            events.append(event)
        }
        return events
    }


    var startEvent: TimerEvent {
        return TimerEvent(text: "Start", type: .start)
    }
}


// MARK: - Timer helpers

private extension ExerciseTimer {
    func makeTimer() -> Timer {
        return Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: timerUpdate)
    }


    func timerUpdate(timer: Timer) {
        print(count, events.count)
        if count == events.count {
            timer.invalidate()
            delegate?.done(self)
            return
        }
        let event = events[self.count]
        print("event", event)
        delegate?.update(self, text: event.text)
        count += 1
    }
}

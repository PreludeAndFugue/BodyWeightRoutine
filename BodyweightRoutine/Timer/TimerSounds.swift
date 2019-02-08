//
//  TimerSounds.swift
//  BodyweightRoutine
//
//  Created by gary on 08/02/2019.
//  Copyright © 2019 Gary Kerr. All rights reserved.
//

import AVFoundation

final class TimerSounds {
    private var player: AVAudioPlayer?


    func play(for eventType: TimerEventType) {
        guard let url = eventType.sound else { return }

        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.wav.rawValue)
            guard let player = player else { return }
            player.play()
        } catch let error {
            print(error.localizedDescription)
        }
    }
}

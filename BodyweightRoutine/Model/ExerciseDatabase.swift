//
//  ExerciseDatabase.swift
//  BodyweightRoutine
//
//  Created by gary on 18/12/2018.
//  Copyright © 2018 Gary Kerr. All rights reserved.
//

import Foundation

struct ExerciseDatabase {
    lazy var routine: Routine = {
        return Routine(groups: [
            ExerciseGroup(title: "Warm up", exercises: warmupExercises),
            ExerciseGroup(title: "Main", exercises: exercises)
        ])
    }()

    
    let warmupExercises: [Exercise] = [
        Exercise(
            name: "Neck circle",
            description: "Wake-up & warm-up the neck joint",
            repetitions: .repetitionsPerSide(10),
            correction: nil,
            imageName: "NeckCircle"
        ),
        Exercise(
            name: "Arm circle forward",
            description: "Wake-up & warm-up the shoulder and scapular joint",
            repetitions: .repetitions(15),
            correction: nil,
            imageName: "ArmCircleForward"
        ),
        Exercise(
            name: "Arm circle backward",
            description: "Wake-up & warm-up the shoulder and scapular joint",
            repetitions: .repetitions(15),
            correction: nil,
            imageName: "ArmCircleBackward"
        ),
        Exercise(
            name: "Wrist circle",
            description: "Wake-up & warm-up the wrist joint",
            repetitions: .repetitionsPerSide(30),
            correction: nil,
            imageName: "WristCircle"
        ),
        Exercise(
            name: "Foot circle",
            description: "Wake-up & warm-up the foot joint",
            repetitions: .repetitionsPerSide(30),
            correction: nil,
            imageName: "FootCircle"
        ),
        Exercise(
            name: "Standing hip circle",
            description: "Wake-up & warm-up the hip joint",
            repetitions: .repetitionsPerSide(15),
            correction: nil,
            imageName: "StandingHipCircle"
        ),
        Exercise(
            name: "Spine circumduction",
            description: "Wake-up & warm-up the spine joint",
            repetitions: .repetitionsPerSide(5),
            correction: nil,
            imageName: "SpineCircumduction"
        )
    ]


    let exercises: [Exercise] = [
        Exercise(
            name: "Passive Hang",
            description: "Structurally realign and open the shoulders and \"decompress\" the joints",
            repetitions: .seconds(60),
            correction: "Compressed body",
            imageName: "PassiveHang"
        ),
        Exercise(
            name: "Seal stretch",
            description: "Open the body (the opposite of compression)",
            repetitions: .seconds(60),
            correction: "Compressed body and especially anterior pelvic tilt",
            imageName: "SealStretch"
        ),
        Exercise(
            name: "Glute bridge",
            description: "Strengthen the hip extensors (while stretching the flexors)",
            repetitions: .repetitions(15),
            correction: "Anterior pelvic tilt",
            imageName: "GluteBridge"
        ),
        Exercise(
            name: "Reverse tabletop",
            description: "Strengthen the shoulder extensors and scapular retractors (while stretching the flexors)",
            repetitions: .seconds(30),
            correction: "Rounded shoulders",
            imageName: "ReverseTabletop"
        ),
        Exercise(
            name: "Air cuban rotation",
            description: "Strengthen shoulder external rotators",
            repetitions: .repetitions(15),
            correction: "Winged scapula",
            imageName: "AirCubanRotation"
        ),
        Exercise(
            name: "Standing spine rotation",
            description: "Strengthen spine rotators",
            repetitions: .repetitionsPerSide(15),
            correction: "Lateral pelvic tilt",
            imageName: "StandingSpineRotation"
        ),
        Exercise(
            name: "Lateral Plank",
            description: "Strengthen spine abductors/adductors",
            repetitions: .secondsPerSide(30),
            correction: "Lateral pelvic tilt",
            imageName: "LateralPlank"
        ),
        Exercise(
            name: "Standing neck extension",
            description: "Strengthen neck extensors",
            repetitions: .repetitions(15),
            correction: "Forward neck posture",
            imageName: "StandingNeckExtension"
        )
    ]
}

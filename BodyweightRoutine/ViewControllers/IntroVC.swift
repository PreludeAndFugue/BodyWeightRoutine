//
//  IntroVC.swift
//  BodyweightRoutine
//
//  Created by gary on 10/01/2019.
//  Copyright © 2019 Gary Kerr. All rights reserved.
//

import UIKit

protocol IntroDelegate: class {
    func didStart(_ vc: IntroVC)
    func about(_ vc: IntroVC)
}

class IntroVC: UIViewController {

    private static let storyboardName = "Main"
    private static let identifier = "IntroVC"

    private weak var delegate: IntroDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
    }


    // MARK: - Actions

    @IBAction func didStart(_ sender: Any) {
        delegate?.didStart(self)
    }


    @IBAction func about(_ sender: Any) {
        delegate?.about(self)
    }
}


// MARK: - Static

extension IntroVC {
    static func make(delegate: IntroDelegate) -> UIViewController {
        let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
        let vc = storyboard.instantiateInitialViewController() as! IntroVC
        vc.delegate = delegate
        return vc
    }
}

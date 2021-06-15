//
//  AboutVC.swift
//  BodyweightRoutine
//
//  Created by gary on 10/01/2019.
//  Copyright © 2019 Gary Kerr. All rights reserved.
//

import UIKit

protocol AboutDelegate: AnyObject {
    func done(_ vc: AboutVC)
    func contactMe(_ vc: AboutVC)
    func viewRedditPost(_ vc: AboutVC)
}

class AboutVC: UIViewController {

    private static let storyboardName = "Main"
    private static let identifier = "AboutNC"

    private weak var delegate: AboutDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }


    @IBAction func done(_ sender: Any) {
        delegate?.done(self)
    }


    @IBAction func contactMe(_ sender: Any) {
        delegate?.contactMe(self)
    }


    @IBAction func viewRedditPost(_ sender: Any) {
        delegate?.viewRedditPost(self)
    }
}


// MARK: - Static

extension AboutVC {
    static func make(delegate: AboutDelegate) -> UIViewController {
        let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
        let nc = storyboard.instantiateViewController(withIdentifier: identifier) as! UINavigationController
        let vc = nc.viewControllers.first as! AboutVC
        vc.delegate = delegate
        return nc
    }
}


// MARK: - Private

private extension AboutVC {
    func configureUI() {
        title = "About"
    }
}

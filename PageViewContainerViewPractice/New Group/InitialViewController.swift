//
//  ViewController.swift
//  PageViewContainerViewPractice
//
//  Created by 坂本龍哉 on 2021/08/27.
//

import UIKit

final class InitialViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction private func explanationButtonDidTapped(_ sender: Any) {
        let operatingVC = OperatingMethodPageViewController.instantiate()
        present(operatingVC, animated: true, completion: nil)
    }
    
}


//
//  OperatingMethodPageViewController.swift
//  PageViewContainerViewPractice
//
//  Created by 坂本龍哉 on 2021/08/27.
//

import UIKit

final class OperatingMethodPageViewController: UIPageViewController {
    
    private var controllers = [UIViewController]()

    override func viewDidLoad() {
        super.viewDidLoad()
        sertupPageViewContorller()
    }
    
    private func sertupPageViewContorller() {
        let firstVC = storyboard?.instantiateViewController(
            withIdentifier: "FirstViewController") as! FirstViewController
        let secondVC = storyboard?.instantiateViewController(
            withIdentifier: "SecondViewController") as! SecondViewController
        let thirdVC = storyboard?.instantiateViewController(
            withIdentifier: "ThirdViewController") as! ThirdViewController
        self.dataSource = self
        controllers = [firstVC, secondVC, thirdVC]
        setViewControllers([controllers[0]],
                           direction: .forward,
                           animated: true,
                           completion: nil)
    }

}

extension OperatingMethodPageViewController: UIPageViewControllerDataSource {
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        controllers.count
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        if let index = controllers.firstIndex(of: viewController),
           index > 0 {
            return controllers[index - 1]
        }
        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        if let index = controllers.firstIndex(of: viewController),
           index < controllers.count - 1 {
            return controllers[index + 1]
        }
        return nil
    }
    
}

extension OperatingMethodPageViewController {
    static func instantiate() -> UIPageViewController {
        let operatingMethodPageVC = UIStoryboard(name: "OperatingMethodPage", bundle: nil).instantiateInitialViewController() as! UIPageViewController
        return operatingMethodPageVC
    }
}
